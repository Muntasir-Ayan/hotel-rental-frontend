// controllers/property.go
package controllers

import (
    "encoding/json"
    "strings"
    "io/ioutil"
    "net/http"
    "hotel-rental-frontend/service" 
    beego "github.com/beego/beego/v2/server/web"
)

type MainController struct {
    beego.Controller
}

func (c *MainController) Get() {
    // Fetch data from backend API
    resp, err := http.Get("http://localhost:8080/v1/property/details")
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

    var hotels []service.Hotel // Use the struct from the service package
    err = json.Unmarshal(body, &hotels)
    if err != nil {
        c.Data["json"] = map[string]string{"error": "Unable to parse JSON"}
        c.ServeJSON()
        return
    }

    // Split location into city and neighborhood
    for i := range hotels {
        locationParts := strings.Split(hotels[i].Location, ",")
        if len(locationParts) > 1 {
            hotels[i].Neighborhood = strings.TrimSpace(locationParts[0])
            hotels[i].City = strings.TrimSpace(locationParts[1])
        }
    }
    for i := range hotels {
        // Remove extra quotes around amenities
        for j, amenity := range hotels[i].Amenities {
            hotels[i].Amenities[j] = strings.Trim(amenity, `"` )
        }
        // Join the cleaned amenities with " . "
        hotels[i].AmenitiesStr = strings.Join(hotels[i].Amenities, " . ")
    }

    // Pass data to the template
    c.Data["Hotels"] = hotels
    c.TplName = "index.tpl"
}
