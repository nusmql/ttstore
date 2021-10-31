package model

import (
	"sync"
	"time"
)

type BaseModel struct {
	Id uint64 `gorm:"primary_key;AUTO_INCREMENT;column:id" json:"-"`
	//CreatedAt time.Time  `gorm:"column:created_at" json:"-"`
	//UpdatedAt time.Time  `gorm:"column:updated_at" json:"-"`
	DeletedAt time.Time `gorm:"column:deleted_at" json:"-"`
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
