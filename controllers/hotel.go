// controllers/hotel.go
package controllers

import (
    "encoding/json"
    "strings"
    "io/ioutil"
    "net/http"
	"hotel-rental-frontend/service"
    beego "github.com/beego/beego/v2/server/web"

)

type HotelController struct {
    beego.Controller
}

func (c *HotelController) Get() {
    hotelID := c.GetString("hotel_id") // Fetch hotel_id from query parameters
    if hotelID == "" {
        c.Data["json"] = map[string]string{"error": "Hotel ID is required"}
        c.ServeJSON()
        return
    }

    // Fetch data from the backend API
    url := "http://localhost:8080/hotel-details?hotel_id=" + hotelID
    resp, err := http.Get(url)
    if err != nil {
        c.Data["json"] = map[string]string{"error": "Unable to fetch data from backend API"}
        c.ServeJSON()
        return
    }
    defer resp.Body.Close()

    body, err := ioutil.ReadAll(resp.Body)
    if err != nil {
        c.Data["json"] = map[string]string{"error": "Unable to read response body"}
        c.ServeJSON()
        return
    }

    var hotel service.Hotel // Use the struct from the service package
    err = json.Unmarshal(body, &hotel)
    if err != nil {
        c.Data["json"] = map[string]string{"error": "Unable to parse JSON"}
        c.ServeJSON()
        return
    }


    // Remove extra quotes around amenities
    for i, amenity := range hotel.Amenities {
        hotel.Amenities[i] = strings.Trim(amenity, `"` )
    }
    hotel.AmenitiesStr = strings.Join(hotel.Amenities, " . ")

	locationParts := strings.Split(hotel.Location, ", ")
    if len(locationParts) == 2 {
        hotel.City = locationParts[1]  // New York
        hotel.Neighborhood = locationParts[0]  // Manhattan
    }

    // Pass hotel data to the template
    c.Data["Hotel"] = hotel
    c.TplName = "hotel_detail.tpl"
}
