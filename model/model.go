package model

import (
	"sync"
	"time"
)

type BaseModel struct {
	Id uint64 `gorm:"primary_key;AUTO_INCREMENT;column:id" json:"-"`
	//CreatedAt time.Time  `gorm:"column:created_at" json:"-"`
	//UpdatedAt time.Time  `gorm:"column:updated_at" json:"-"`
	DeletedAt time.Time `gorm:"column:deleted_at;default:null;" json:"-"`
}

type UserInfo struct {
	Username string `json:"username"`
	Gender   string `json:"gender"`
	NickName string `json:"nick_name"`
	Mobile   string `json:"mobile"`
	Email    string `json:"email"`
	CreatedAt string `json:"created_at"`
	UpdatedAt string `json:"updated_at"`
}

type UserList struct {
	Lock  *sync.Mutex
	IdMap map[uint64]*UserInfo
}
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
type OrderInfo struct {
	OrderId         uint64    `json:"order_id"`
	UserId          uint64    `json:"user_id"`
	OrderSn         string    `json:"order_sn"`
	OrderStatus     uint8     `json:"order_status"`
	AftersaleStatus uint8     `json:"aftersale_status"`
	Consignee       string    `json:"consignee"`
	Mobile          string    `json:"mobile"`
	Address         string    `json:"address" `
	Message         string    `json:"message"`
	GoodsPrice      float32   `json:"goods_price"`
	FreightPrice    float32   `json:"freight_price"`
	OrderPrice      float32   `json:"order_price"`
	CreatedAt       string    `json:"created_at"`
	UpdatedAt       string    `json:"updated_at"`
	Products        []*Product `json:"products"`
}

type OrderList struct {
	Lock  *sync.Mutex
	IdMap map[uint64]*OrderInfo
}
