package user

import (
	"github.com/gin-gonic/gin"
	. "ttstore/handler"
	"ttstore/model"
	"ttstore/pkg/errno"
)

func Get(c *gin.Context) {
	id := c.Param("id")

	//get user info by user 'uid'
	user, err := model.GetUser(id)
	if err!=nil {
		SendResponse(c, errno.ErrUserNotFound, nil)
	}

	SendResponse(c, nil, user)
}
