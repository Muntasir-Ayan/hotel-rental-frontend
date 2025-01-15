package main

import (
	_ "hotel-rental-frontend/routers"
	beego "github.com/beego/beego/v2/server/web"
)

func main() {
	beego.Run()
}

