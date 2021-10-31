package model

import (
	"github.com/go-playground/validator/v10"
	"time"
	"ttstore/pkg/constvar"
)

type OrderModel struct {
	BaseModel
	UserId          uint64            `json:"user_id" gorm:"column:user_id; not null"`
	OrderSn         string            `json:"order_sn" gorm:"column:order_sn; not null"`
	OrderStatus     uint8             `json:"order_status" gorm:"column:order_status; not null"`
	AftersaleStatus uint8             `json:"aftersale_status" gorm:"column:aftersale_status; not null"`
	Consignee       string            `json:"consignee" gorm:"column:consignee; not null"`
	Mobile          string            `json:"mobile"  gorm:"column:mobile; not null"`
	Address         string            `json:"address"  gorm:"column:address; not null"`
	Message         string            `json:"message" gorm:"column:message;"`
	GoodsPrice      float32           `json:"goods_price" gorm:"column:goods_price;"`
	FreightPrice    float32           `json:"freight_price" gorm:"column:freight_price;"`
	OrderPrice      float32           `json:"order_price" gorm:"column:order_price;"`
	PayId           string            `json:"pay_id" gorm:"column:pay_id;"`
	PayTime         *time.Time        `json:"pay_time" gorm:"column:pay_time;"`
	ShipSn          string            `json:"ship_sn" gorm:"column:ship_sn;"`
	ShipChannel     string            `json:"ship_channel" gorm:"column:ship_channel;"`
	ShipTime        *time.Time        `json:"ship_time" gorm:"column:ship_time;"`
	ConfirmTime     *time.Time        `json:"confirm_time" gorm:"column:confirm_time;"`
	OrderGoods      []OrderGoodsModel `gorm:"foreignKey:OrderId;references:Id;constraint:OnDelete:CASCADE;"`
}

func (o *OrderModel) TableName() string {
	return "tb_order"
}

// Create order
func (o *OrderModel) Create() error {
	//DB.Self.AutoMigrate(&OrderModel{}, &OrderGoodsModel{})
	return DB.Self.Create(&o).Error
}

// Validate the fields.
func (o *OrderModel) Validate() error {
	validate := validator.New()
	return validate.Struct(o)
}

func DeleteOrder(id uint64) error {
	order := OrderModel{}
	order.BaseModel.Id = id
	return DB.Self.Delete(&order).Error
}

func CancelOrder(id, userId uint64) error {
	return DB.Self.Model(&OrderModel{}).Where("id =? AND user_id=?", id, userId).Update("order_status", constvar.ORDER_STATUS_CANCEL).Error
}
