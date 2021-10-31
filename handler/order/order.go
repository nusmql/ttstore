package order

import (
	. "ttstore/model"
)

type CreateRequest struct {
	UserId          uint64    `json:"user_id"`
	OrderSn         string    `json:"order_sn"`
	OrderStatus     uint8     `json:"order_status"`
	AftersaleStatus uint8     `json:"aftersale_status"`
	Consignee       string    `json:"consignee"`
	Mobile          string    `json:"mobile"`
	Address         string    `json:"address"`
	Message         string    `json:"message"`
	GoodsPrice      float32   `json:"goods_price"`
	FreightPrice    float32   `json:"freight_price"`
	OrderPrice      float32   `json:"order_price"`
	Products        []Product `json:"products"`
}

type CreateResponse struct {
	UserId          uint64  `json:"user_id"`
	OrderSn         string  `json:"order_sn"`
	OrderStatus     uint8   `json:"order_status"`
	AftersaleStatus uint8   `json:"aftersale_status"`
	Consignee       string  `json:"consignee"`
	Mobile          string  `json:"mobile"`
	Address         string  `json:"address" `
	Message         string  `json:"message"`
	GoodsPrice      float32 `json:"goods_price"`
	FreightPrice    float32 `json:"freight_price"`
	OrderPrice      float32 `json:"order_price"`
}

type ListRequest struct {
	UserId string `json:user_id`
	Offset int    `json:"offset"`
	Limit  int    `json:"limit"`
}

type ListResponse struct {
	TotalCount uint64       `json:"total_count"`
	Orders     []*OrderInfo `json:"orders"`
}
