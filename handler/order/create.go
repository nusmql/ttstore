package order

import (
	"github.com/gin-gonic/gin"
	"github.com/lexkong/log"
	. "ttstore/handler"
	"ttstore/model"
	"ttstore/pkg/constvar"
	"ttstore/pkg/errno"
)

func Create(c *gin.Context) {
	var r CreateRequest
	if err := c.Bind(&r); err != nil {
		log.Error("Binding error:", err)
		SendResponse(c, errno.ErrBind, nil)
		return
	}

	orderGoods := []model.OrderGoodsModel{}

	for _, od := range r.Products {
		orderGoods = append(orderGoods, model.OrderGoodsModel{
			GoodsId:   od.GoodsId,
			GoodsName: od.GoodsName,
			GoodsSn:   od.GoodsSn,
			ProductId: od.ProductId,
			Quantity:  od.Quantity,
			Price:     od.Price,
		})
	}

	o := model.OrderModel{
		UserId:       r.UserId,
		OrderSn:      r.OrderSn,
		OrderStatus:  constvar.ORDER_STATUS_CREATE,
		Consignee:    r.Consignee,
		Mobile:       r.Mobile,
		Address:      r.Address,
		GoodsPrice:   r.GoodsPrice,
		FreightPrice: r.FreightPrice,
		OrderPrice:   r.OrderPrice,
		OrderGoods:   orderGoods,
	}

	// validate the data
	err := o.Validate()
	if err != nil {
		SendResponse(c, errno.ErrValidation, nil)
		return
	}

	if err := o.Create(); err != nil {
		log.Error("Create order failed:", err)
		SendResponse(c, errno.ErrDatabase, nil)
		return
	}

	rsp := CreateResponse{
		UserId:       r.UserId,
		OrderSn:      r.OrderSn,
		OrderStatus:  constvar.ORDER_STATUS_CREATE,
		Consignee:    r.Consignee,
		Mobile:       r.Mobile,
		Address:      r.Address,
		GoodsPrice:   r.GoodsPrice,
		FreightPrice: r.FreightPrice,
		OrderPrice:   r.OrderPrice,
	}

	SendResponse(c, nil, rsp)

}
