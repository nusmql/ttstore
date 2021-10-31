package service

import (
	"sync"
	"ttstore/model"
)

func ListUser(offset, limit int) ([]*model.UserInfo, uint64, error) {
	infos := make([]*model.UserInfo, 0)

	users, count, err := model.ListUser(offset, limit)
	if err != nil {
		return nil, count, err
	}

	ids := []uint64{}

	for _, user := range users {
		ids = append(ids, user.Id)
	}

	wg := sync.WaitGroup{}
	userList := model.UserList{
		Lock:  new(sync.Mutex),
		IdMap: make(map[uint64]*model.UserInfo, len(users)),
	}

	errChan := make(chan error, 1)
	finishChan := make(chan bool, 1)

	for _, u := range users {
		wg.Add(1)
		go func(u *model.UserModel) {
			defer wg.Done()

			userList.Lock.Lock()
			defer userList.Lock.Unlock()

			userList.IdMap[u.Id] = &model.UserInfo{
				Username:  u.Username,
				NickName:  u.NickName,
				Gender:    string(u.Gender),
				Email:     u.Email,
				Mobile:    u.Mobile,
				CreatedAt: u.CreatedAt.Format("2006-01-02 15:04:05"),
				UpdatedAt: u.UpdatedAt.Format("2006-01-02 15:04:05"),
			}
		}(u)
	}

	go func() {
		wg.Wait()
		close(finishChan)
	}()

	select {
	case <-finishChan:
	case err := <-errChan:
		return nil, count, err
	}
	for _, id := range ids {
		infos = append(infos, userList.IdMap[id])
	}
	return infos, count, nil
}

func ListOrder(userId uint64, offset, limit uint) ([]*model.OrderInfo, uint64, error) {
	infos := make([]*model.OrderInfo, 0)

	orders, count, err := model.ListOrder(userId, offset, limit)
	if err != nil {
		return nil, count, err
	}

	ids := []uint64{}

	for _, order := range orders {
		ids = append(ids, order.Id)
	}

	wg := sync.WaitGroup{}
	orderList := model.OrderList{
		Lock:  new(sync.Mutex),
		IdMap: make(map[uint64]*model.OrderInfo, len(orders)),
	}

	errChan := make(chan error, 1)
	finishChan := make(chan bool, 1)

	for _, o := range orders {
		wg.Add(1)
		go func(o *model.OrderModel,errchan chan error) {
			defer wg.Done()

			orderList.Lock.Lock()
			defer orderList.Lock.Unlock()

			products, err := model.ListOrderGoods(o.Id)
			if err !=nil {
				errchan <- err
			}

			orderList.IdMap[o.Id] = &model.OrderInfo{
				OrderId:  o.Id,
				UserId:  o.UserId,
				OrderSn:    o.OrderSn,
				OrderStatus:    o.OrderStatus,
				AftersaleStatus: o.AftersaleStatus,
				Consignee:       o.Consignee,
				Mobile:          o.Mobile,
				Address:         o.Address,
				Message:         o.Message,
				GoodsPrice:      o.GoodsPrice,
				FreightPrice:    o.FreightPrice,
				OrderPrice:      o.OrderPrice,
				CreatedAt:       o.CreatedAt.Format("2006-01-02 15:04:05"),
				UpdatedAt:       o.UpdatedAt.Format("2006-01-02 15:04:05"),
				Products:        products,
			}
		}(o, errChan)
	}

	go func() {
		wg.Wait()
		close(finishChan)
	}()

	select {
	case <-finishChan:
	case err := <-errChan:
		return nil, count, err
	}
	for _, id := range ids {
		infos = append(infos, orderList.IdMap[id])
	}
	return infos, count, nil
}