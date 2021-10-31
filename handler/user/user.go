package user

import "ttstore/model"

type CreateRequest struct {
	Username string `json:"username"`
	Nickname string `json:"nick_name"`
	Email string `json:"email"`
	Mobile string `json:"mobile"`
	Gender uint8 `json:"gender"`
}

type CreateResponse struct {
	Username string `json:"username"`
	Nickname string `json:"nick_name"`
	Email string `json:"email"`
	Mobile string `json:"mobile"`
}

type ListRequest struct {
	uid string `json:uid`
	Offset int `json:"offset"`
	Limit int `json:"limit"`
}

type ListResponse struct {
	TotalCount uint64 `json:"total_count"`
	UserList []*model.UserInfo `json:"user_list"`
}