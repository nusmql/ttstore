package order

import (
	"github.com/gin-gonic/gin"
	"strconv"
	. "ttstore/handler"
	"ttstore/model"
	"ttstore/pkg/errno"
)

func Delete(c *gin.Context) {
	orderId, _ := strconv.Atoi(c.Param("id"))
	if err := model.DeleteOrder(uint64(orderId)); err != nil {
		SendResponse(c, errno.ErrDatabase, nil)
		return
	}

	SendResponse(c, nil, nil)
}
