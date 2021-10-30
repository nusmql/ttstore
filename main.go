package main

import (
	"errors"
	"github.com/gin-gonic/gin"
	"github.com/lexkong/log"
	"github.com/spf13/pflag"
	"github.com/spf13/viper"
	"net/http"
	"time"
	"ttstore/config"
	"ttstore/model"
	"ttstore/router"
)

var (
	cfg = pflag.StringP("config", "c", "", "ttstore config file path.")
)

func main() {
	pflag.Parse()

	// init config
	if err := config.Init(*cfg); err != nil {
		panic(err)
	}

	// init db
	model.DB.Init()
	defer model.DB.Close()

	// set gin mode
	gin.SetMode(viper.GetString("runmode"))

	// Create the Gin engine.
	g := gin.New()

	middlewares := []gin.HandlerFunc{}

	// Routes
	router.Load(
		// Cores
		g,
		// Middlewares
		middlewares...,
	)

	// ping the server to make sure the router is working
	go func() {
		if err := pingServer(); err != nil {
			log.Fatal("The router has no response, or it might took too long to start up.", err)
		}
		log.Info("The router has been deployed successfully.")
	}()

	log.Infof("Start to listening the incoming requests on http address: %s", viper.GetString("addr"))
	log.Infof(http.ListenAndServe(viper.GetString("addr"), g).Error())

}

func pingServer() error {
	for i := 0; i < viper.GetInt("max_ping_count"); i++ {
		res, err := http.Get(viper.GetString("url") + "/sd/health")

		if err == nil && res.StatusCode == 200 {
			return nil
		}
		log.Info("Waiting for the router, retry in 1 second.")
		time.Sleep(time.Second * 1)
	}
	return errors.New("Cannot connect to the router.")
}
