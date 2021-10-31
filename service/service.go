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
				Uid:        u.Uid,
				Username:   u.Username,
				NickName:   u.NickName,
				Gender:     string(u.Gender),
				Birthday:   u.Birthday,
				Email:      u.Email,
				Mobile:     u.Mobile,
				AddTime:    u.AddTime.Format("2006-01-02 15:04:05"),
				UpdateTime: u.UpdateTime.Format("2006-01-02 15:04:05"),
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
