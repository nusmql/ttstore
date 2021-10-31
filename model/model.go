package model

import (
	"sync"
)

type BaseModel struct {
	Id uint64 `gorm:"primary_key;AUTO_INCREMENT;column:id" json:"-"`
	//Addtime time.Time  `gorm:"column:add_time" json:"-"`
	//UpdateTime time.Time  `gorm:"column:update_time" json:"-"`
	Deleted uint8 `gorm:"column:deleted" sql:"index" json:"-"`
}

type UserInfo struct {
	Uid        string `json:"uid"`
	Username   string `json:"username"`
	Gender     string `json:"gender"`
	NickName   string `json:"nick_name"`
	Mobile     string `json:"mobile"`
	Email      string `json:"email"`
	AddTime    string `json:"add_time"`
	UpdateTime string `json:"update_time"`
}

type UserList struct {
	Lock  *sync.Mutex
	IdMap map[uint64]*UserInfo
}
