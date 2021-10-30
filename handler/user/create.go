package user

import (
	"github.com/gin-gonic/gin"
	"github.com/lexkong/log"
	. "ttstore/handler"
	"ttstore/model"
	"ttstore/pkg/errno"
)

// Create creates a new user account.
func Create(c *gin.Context) {
	var r CreateRequest
	if err := c.Bind(&r); err != nil {
		SendResponse(c, errno.ErrBind, nil)
		return
	}

	u := model.UserModel{
		Username: r.Username,
		Password: "123456",
		Email: r.Email,
		Mobile: r.Mobile,
		Gender: r.Gender,
		NickName: r.Nickname,
	}

	// Validate the data.
	if err := u.Validate(); err != nil {
		log.Error("Create user failed:", err)
		SendResponse(c, errno.ErrValidation, nil)
		return
	}

	// Encrypt the user password.
	if err := u.Encrypt(); err != nil {
		SendResponse(c, errno.ErrEncrypt, nil)
		return
	}

	// Insert the user to the database.
	if err := u.Create(); err != nil {
		log.Error("Create user failed:", err)
		SendResponse(c, errno.ErrDatabase, nil)
		return
	}


	rsp := CreateResponse{
		Username: r.Username,
	}

	// Show the user information.
	SendResponse(c, nil, rsp)

}
