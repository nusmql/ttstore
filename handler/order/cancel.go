package order

import (
	"github.com/gin-gonic/gin"
	"strconv"
	. "ttstore/handler"
	"ttstore/model"
	"ttstore/pkg/errno"
)

func Cancel(c *gin.Context) {
	orderId, _ := strconv.Atoi(c.Param("id"))
	userId, _ := strconv.Atoi(c.Param("userId"))

	// by right here we need check the userid vs hash in header
	// to confirm the user permission

	if err := model.CancelOrder(uint64(orderId), uint64(userId)); err != nil {
		SendResponse(c, errno.ErrDatabase, nil)
		return
	}

	SendResponse(c, nil, nil)
}