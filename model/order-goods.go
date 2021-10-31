package model

type OrderGoodsModel struct {
	BaseModel
	GoodsId        uint64  `json:"goods_id" gorm:"column:goods_id; not null"`
	OrderId        uint64  `json:"order_id" gorm:"column:order_id; not null"`
	GoodsName      string  `json:"goods_name" gorm:"column:goods_name; not null"`
	GoodsSn        string  `json:"goods_sn" gorm:"column:goods_sn; not null"`
	ProductId      uint64  `json:"product_id" gorm:"column:product_id; not null"`
	Quantity       uint8   `json:"quantity" gorm:"column:quantity; not null;"`
	Price          float32 `json:"price" gorm:"column:price;not null;"`
	Specifications string  `json:"specifications" gorm:"column:specifications;"`
	PicUrl         string  `json:"pic_url" gorm:"column:pic_url;"`
}

func (o *OrderGoodsModel) TableName() string {
	return "tb_order_goods"
}

// Create order goods
func (o *OrderGoodsModel) Create() error {
	return DB.Self.Create(&o).Error
}

func DeleteOrderGoods(orderId uint64) error {
	return DB.Self.Where("order_id=?", orderId).Delete(&OrderGoodsModel{}).Error
}

// ListOrderGoods List all product
func ListOrderGoods(orderId uint64) ([]*Product, error) {

	products := make([]*Product, 0)
	orderGoods := make([]*OrderGoodsModel, 0)

	if err := DB.Self.Where("order_id=?", orderId).Find(&orderGoods).Error; err != nil {
		return nil, err
	}
	for _, lo := range orderGoods {
		products = append(products, &Product{
			GoodsId:        lo.GoodsId,
			GoodsName:      lo.GoodsName,
			GoodsSn:        lo.GoodsSn,
			ProductId:      lo.ProductId,
			Quantity:       lo.Quantity,
			Price:          lo.Price,
			Specifications: lo.Specifications,
			PicUrl:         lo.PicUrl,
		})
	}

	return products, nil
}
