package user

import (
	"github.com/gin-gonic/gin"
	"github.com/lexkong/log"
	"github.com/lexkong/log/lager"
	"ttstore/model"
	"ttstore/pkg/errno"
	"ttstore/util"

	. "ttstore/handler"
)

func Update(c *gin.Context) {
	log.Info("Update user called.", lager.Data{"X-Request-Id": util.GetReqID(c)})
	// Get the user id from the url parameter.
	uid := c.Param("uid")
	log.Info("Received UID: ", lager.Data{"uid": uid})

	var u model.UserModel
	if err := c.Bind(&u); err != nil {
		log.Error("Error:", err)
		SendResponse(c, errno.ErrBind, nil)
		return
	}

	u.Uid = uid

	// Validate the data.
	if err := u.Validate(); err != nil {
		log.Error("Validation Error:", err)
		SendResponse(c, errno.ErrValidation, nil)
		return
	}

	// Encrypt the user password.
	if u.Password != "" {
		if err := u.Encrypt(); err != nil {
			SendResponse(c, errno.ErrEncrypt, nil)
			return
		}
	}

	// Save changed fields.
	if err := u.Update(uid); err != nil {
		log.Error("DB Error:", err)
		SendResponse(c, errno.ErrDatabase, nil)
		return
	}

	SendResponse(c, nil, nil)
}
