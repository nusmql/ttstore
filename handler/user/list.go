package user

import (
	"github.com/gin-gonic/gin"
	. "ttstore/handler"
	"ttstore/pkg/errno"
	"ttstore/service"
)

// List all customer in db
func List(c *gin.Context) {
	var r ListRequest
	if err := c.Bind(&r); err != nil {
		SendResponse(c, errno.ErrBind, nil)
		return
	}

	infos, count, err := service.ListUser(r.Offset, r.Limit)

	if err != nil {
		SendResponse(c, err, nil)
	}
	SendResponse(c, nil, ListResponse{
		TotalCount: count,
		UserList:   infos,
	})
}
