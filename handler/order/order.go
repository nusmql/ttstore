package order

type Product struct {
	GoodsId        uint64  `json:"goods_id"`
	GoodsName      string  `json:"goods_name"`
	GoodsSn        string  `json:"goods_sn"`
	ProductId      uint64  `json:"product_id"`
	Quantity       uint8   `json:"quantity"`
	Price          float32 `json:"price"`
	Specifications string  `json:"specifications"`
	PicUrl         string  `json:"pic_url"`
}

type CreateRequest struct {
	UserId          uint64  `json:"user_id"`
	OrderSn         string  `json:"order_sn"`
	OrderStatus     uint8   `json:"order_status"`
	AftersaleStatus uint8   `json:"aftersale_status"`
	Consignee       string  `json:"consignee"`
	Mobile          string  `json:"mobile"`
	Address         string  `json:"address"`
	Message         string  `json:"message"`
	GoodsPrice      float32 `json:"goods_price"`
	FreightPrice    float32 `json:"freight_price"`
	OrderPrice      float32 `json:"order_price"`
	Products           []Product `json:"products"`
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
