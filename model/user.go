package model

import (
	validator "github.com/go-playground/validator/v10"
	"time"
	"ttstore/pkg/auth"
	"ttstore/pkg/constvar"
)

// User represents a registered user.
type UserModel struct {
	BaseModel
	Username string     `json:"username" gorm:"column:username;not null" binding:"required" validate:"min=1,max=64"`
	Password string     `json:"password,omitempty" gorm:"column:password;not null" validate:"omitempty,min=5,max=64"`
	Email    string     `json:"email,omitempty" gorm:"column:email;" validate:"omitempty,email"`
	Mobile   string     `json:"mobile" gorm:"column:mobile;"`
	Gender   uint8      `json:"gender" gorm:"column:gender" validate:"omitempty,gte=0,lte=2"`
	NickName string     `json:"nick_name" gorm:"column:nick_name"`
	CreatedAt *time.Time `json:"created_at" gorm:"column:created_at"`
	UpdatedAt *time.Time `json:"updated_at" gorm:"column:updated_at"`
}

func (u *UserModel) TableName() string {
	return "tb_user"
}

// Create creates a new user account.
func (u *UserModel) Create() error {
	return DB.Self.Create(&u).Error
}

// DeleteUser deletes the user by the user identifier.
func DeleteUser(id uint64) error {
	user := UserModel{}
	user.BaseModel.Id = id
	return DB.Self.Delete(&user).Error
}

// Update updates an user account information.
func (u *UserModel) Update() error {
	return DB.Self.Save(u).Error
}

// GetUser gets an user by the user uid.
func GetUser(id string) (*UserModel, error) {
	u := &UserModel{}
	d := DB.Self.Where("id = ?", id).First(&u)
	return u, d.Error
}

// ListUser List all users
func ListUser(offset, limit int) ([]*UserModel, uint64, error) {
	if limit == 0 {
		limit = constvar.DefaultLimit
	}

	users := make([]*UserModel, 0)
	var count uint64

	//where := fmt.Sprintf("username like '%%%s%%'", username)
	if err := DB.Self.Model(&UserModel{}).Count(&count).Error; err != nil {
		return users, count, err
	}

	if err := DB.Self.Offset(offset).Limit(limit).Order("id desc").Find(&users).Error; err != nil {
		return users, count, err
	}

	return users, count, nil
}

// Encrypt the user password.
func (u *UserModel) Encrypt() (err error) {
	u.Password, err = auth.Encrypt(u.Password)
	return
}

// Validate the fields.
func (u *UserModel) Validate() error {
	validate := validator.New()
	return validate.Struct(u)
}
