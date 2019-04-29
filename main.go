package main

import (
	"net/http"

	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
)

// RootResponse is type of response to root
type RootResponse struct {
	Message string `json:"message"`
	Input   string `json:"input"`
	Outout  string `json:"output"`
}

func main() {
	e := echo.New()

	e.Use(middleware.Logger())
	e.Use(middleware.Recover())

	e.GET("/", func(c echo.Context) error {
		input := c.QueryParam("input")
		if input != "" {
			return c.JSON(http.StatusOK, &RootResponse{
				Message: "success",
				Input:   input,
				Outout:  "output",
			})
		} else {
			return c.JSON(http.StatusBadRequest, &RootResponse{
				Message: "no input detected",
				Input:   "",
				Outout:  "",
			})
		}
	})

	e.Start(":8100")
}
