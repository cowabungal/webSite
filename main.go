package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"os"
)

func indexHandler(c *gin.Context)  {
	c.HTML(http.StatusOK, "index.html", nil)
}

func main() {
	port := os.Getenv("PORT")

	if port == "" {
		port = "3000"
	}

	r := gin.Default()

	r.LoadHTMLGlob("./*.html")
	r.Static("/assets", "./assets")

	r.GET("/", indexHandler)

	r.Run(":" + port)
}