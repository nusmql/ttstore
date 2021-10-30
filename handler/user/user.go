package user
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