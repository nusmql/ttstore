package model

type CartModel struct {
	BaseModel
	UserId         uint64  `json:"user_id" gorm:"column:user_id; not null"`
	GoodsId        uint64  `json:"goods_id" gorm:"column:goods_id; not null"`
	GoodsSn        string  `json:"goods_sn" gorm:"column:goods_sn; not null"`
	GoodsName      string  `json:"goods_name" gorm:"column:goods_name; not null"`
	ProductId      uint64  `json:"product_id" gorm:"column:product_id; not null"`
	Quantity       uint8   `json:"quantity" gorm:"column:quantity; not null;"`
	Price          float32 `json:"price" gorm:"column:price;not null;"`
	Specifications string  `json:"specifications" gorm:"column:specifications;"`
	PicUrl         string  `json:"pic_url" gorm:"column:pic_url;"`
	Checked        uint8   `json:"checked" gorm:"column:checked;not null;"`
}

func (c *CartModel) TableName() string {
	return "tb_cart"
}

// Create record to Cart
func (c *CartModel) Create() error {
	return DB.Self.Create(&c).Error
}

// Get item detail.
func Get(id string) (*CartModel, error) {
	c := &CartModel{}
	d := DB.Self.Where("id = ?", id).First(&c)
	return c, d.Error
}