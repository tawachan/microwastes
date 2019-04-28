package main

import (
	"net/http"

	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
)

func main() {
	// Echoのインスタンス作る
	e := echo.New()

	// 全てのリクエストで差し込みたいミドルウェア（ログとか）はここ
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())

	// ルーティング
	e.GET("/", func(c echo.Context) error { //c をいじって Request, Responseを色々する
		return c.String(http.StatusOK, "root")
	})

	// サーバー起動
	e.Start(":8100") //ポート番号指定してね
}
