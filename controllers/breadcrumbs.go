//controllers/breadcrumbs.go

package controllers

import (
    "encoding/json"
    "strings"
    "io/ioutil"
    "net/http"
    "hotel-rental-frontend/service"
    beego "github.com/beego/beego/v2/server/web"
)

type BreadCrumbs struct {
    beego.Controller
}

func (c *BreadCrumbs) Get() {
    location := c.GetString("location") // Get the location from the URL parameter

    // Fetch all hotels from the backend API
    resp, err := http.Get("http://localhost:8080/v1/property/list")
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

    // Structure to map the hotels by location
    var hotelData map[string]map[string]map[string][]service.Hotel
    err = json.Unmarshal(body, &hotelData)
    if err != nil {
        c.Data["json"] = map[string]string{"error": "Unable to parse JSON"}
        c.ServeJSON()
        return
    }

    // Find the hotels matching the location
	var filteredHotels []service.Hotel
	for city, neighborhoods := range hotelData {
		for neighborhood, hotels := range neighborhoods {
			// Check if the city or neighborhood matches the location string
			if strings.Contains(city, location) || strings.Contains(neighborhood, location) {
				// Iterate over the map to get the slice of hotels and append to filteredHotels
				for _, hotelList := range hotels {
					for _, hotel := range hotelList {
						// Extract Neighborhood and City from the location
						locationParts := strings.Split(hotel.Location, ",")
						if len(locationParts) > 1 {
							hotel.Neighborhood = strings.TrimSpace(locationParts[0]) // Neighborhood is the first part
							hotel.City = strings.TrimSpace(locationParts[1])        // City is the second part
						} else {
							hotel.City = locationParts[0] // If location is just one part (no comma)
							hotel.Neighborhood = ""       // No neighborhood
						}
	
						// Remove extra quotes around amenities (same as you did in the first part of the code)
						for j, amenity := range hotel.Amenities {
							hotel.Amenities[j] = strings.Trim(amenity, `"`) // Trim quotes around amenities
						}
	
						// Join the cleaned amenities with " . "
						hotel.AmenitiesStr = strings.Join(hotel.Amenities, " . ")
	
						// Add hotel to the filtered list
						filteredHotels = append(filteredHotels, hotel)
					}
				}
			}
		}
	}

    // Pass filtered hotels to the template
    c.Data["Hotels"] = filteredHotels
    c.TplName = "index.tpl"
}