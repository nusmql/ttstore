package user

import (
	"github.com/gin-gonic/gin"
	. "ttstore/handler"
	"ttstore/model"
	"ttstore/pkg/errno"
)

func Get(c *gin.Context) {
	uid := c.Param("uid")

	//get user info by user 'uid'
	user, err := model.GetUser(uid)
	if err!=nil {
		SendResponse(c, errno.ErrUserNotFound, nil)
	}

	SendResponse(c, nil, user)
}
