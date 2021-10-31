package router

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"ttstore/handler/order"
	"ttstore/handler/sd"
	"ttstore/handler/user"
	"ttstore/router/middleware"
)

func Load(g *gin.Engine, mw ...gin.HandlerFunc) *gin.Engine {
	// middlewares
	g.Use(gin.Recovery())
	g.Use(middleware.NoCache())
	g.Use(middleware.Options())
	g.Use(middleware.Secure())
	g.Use(mw...)

	// 404 Handler
	g.NoRoute(func(c *gin.Context) {
		c.String(http.StatusNotFound, "The incorrect API route.")
	})

	// user handler
	u:= g.Group("/v1/user")
	{
		u.POST("", user.Create)
		u.GET("/:id", user.Get)
		u.GET("", user.List)
		u.PUT("/:id", user.Update)
	}

	// order handler
	o:= g.Group("/v1/order")
	{
		o.POST("", order.Create)
	}

	// The health check handlers
	svcd := g.Group("/sd")
	{
		svcd.GET("/health", sd.HealthCheck)
		svcd.GET("/disk", sd.DiskCheck)
		svcd.GET("/cpu", sd.CPUCheck)
		svcd.GET("/ram", sd.RAMCheck)
	}


	return g
}
