package routers

import (
	"hotel-rental-frontend/controllers"
	beego "github.com/beego/beego/v2/server/web"
)

func init() {
    beego.Router("/", &controllers.MainController{})
	beego.Router("/hotel-details", &controllers.HotelController{})
}
