<!-- views/index.tpl -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotels in New York</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/static/css/index.css">
</head>
<body class="bg-gray-100">
    <!-- Navigation -->
{{template "nav.tpl" .}}

    <div class="container">
 
        <!-- Property Grid -->
        <div class="row">
            {{range .Hotels}}
            <div class="col-md-4 mb-4">
                <div class="property-card">
                    <!-- Image container with a fixed height -->
                    <div class="image-container relative">
                        <img src="{{index .ImageURLs 0}}" alt="{{.HotelName}}">
                    </div>
                    <div class="content">
                        <!-- Hotel name clickable -->
                        <div class="flex justify-between items-start mb-2">
                          <a href="/hotel-details?hotel_id={{.HotelID}}" class="text-blue-500 hover:underline">{{.HotelName}}</a>
                            <div class="rating-badge">
                                <span>{{.Rating}}</span>
                                <span class="ml-1">({{.ReviewCount}} reviews)</span>
                            </div>
                        </div>
                        <!-- Location -->
                        <div class="container">
                            <div class="d-flex justify-content-between align-items-center mt-4">
                                <!-- First column: City and Neighborhood -->
                                <div class="">
                                    <p class="text-gray-600 mb-2">
                                        <a href="/hotels?location={{.City}}" class="text-blue-500 hover:underline">{{.City}}</a> > 
                                        <a href="/hotels?location={{.Neighborhood}}" class="text-blue-500 hover:underline">{{.Neighborhood}}</a>
                                    </p>
                                </div>
                                
                                <!-- Second column: Hotel Type -->
                                <div class="">
                                    <p>{{.Type}}</p>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Amenities -->
                        <div class="amenities">
                            {{range .Amenities}}
                            <span class="amenity">{{.}}</span>
                            {{end}}
                        </div>
                        <!-- Price and View Availability button -->
                        <div class="d-flex justify-content-between align-items-center mt-4">
                            <div class="price">{{.Price}}</div>
                            <a href="#" class="view-availability-btn">View Availability</a>
                        </div>
                    </div>
                </div>
            </div>
            {{end}}
        </div>
    </div>
</body>
</html>
