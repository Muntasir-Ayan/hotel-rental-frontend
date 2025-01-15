// service/structure.go
package service

type Hotel struct {
    HotelID      string   `json:"hotel_id"`
    HotelName    string   `json:"hotel_name"`
    Location     string   `json:"location"`
    Rating       float64  `json:"rating"`
    ReviewCount  int      `json:"review_count"`
    Bedrooms  	 int      `json:"bedrooms"`
    Guests  	 int      `json:"guest_count"`
    Bathrooms    int      `json:"bathroom"`
    Price        string   `json:"price"`
    ImageURLs    []string `json:"image_urls"`
    Type         string   `json:"type"`
    Amenities    []string `json:"amenities"`
    AmenitiesStr string   // New field for joined amenities
    City         string   `json:"city"`  // New field for City
    Neighborhood string   `json:"neighborhood"`
	Description  string   `json:"description"`
}
