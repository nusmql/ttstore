package order

import (
	"github.com/gin-gonic/gin"
	"strconv"
	. "ttstore/handler"
	"ttstore/pkg/errno"
	"ttstore/service"
)

func List(c *gin.Context) {
	userId, _ := strconv.Atoi(c.Query("user_id"))
	offset, _ := strconv.Atoi(c.DefaultQuery("offset", "0"))
	limit, _ := strconv.Atoi(c.DefaultQuery("limit", "10"))
	//var r ListRequest

	if userId == 0 {
		SendResponse(c, errno.ErrBind, nil)
		return
	}

	orders, count, err := service.ListOrder(uint64(userId), uint(offset), uint(limit))

	if err != nil {
		SendResponse(c, err, nil)
	}
	SendResponse(c, nil, ListResponse{
		TotalCount: count,
		Orders:     orders,
	})
}
