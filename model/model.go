package model

import (
	"sync"
	"time"
)

type BaseModel struct {
	Id        uint64     `gorm:"primary_key;AUTO_INCREMENT;column:id" json:"-"`
	//Addtime time.Time  `gorm:"column:add_time" json:"-"`
	//UpdateTime time.Time  `gorm:"column:update_time" json:"-"`
	Deleted uint8 `gorm:"column:deleted" sql:"index" json:"-"`
}

type UserInfo struct {
	Id        uint64 `json:"id"`
	Username  string `json:"username"`
	Password  string `json:"password"`
	Gender  string `json:"gender"`
	Birthday *time.Time `json:"birthday"`
	NickName string `json:"nick_name"`
	Mobile string `json:"mobile"`
	Email string `json:"email"`
	AddTime string `json:"add_time"`
	UpdateTime string `json:"update_time"`
}

type UserList struct {
	Lock  *sync.Mutex
	IdMap map[uint64]*UserInfo
}

// Token represents a JSON web token.
type Token struct {
	Token string `json:"token"`
}