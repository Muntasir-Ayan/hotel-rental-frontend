<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotels in New York</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/static/css/index.css">
</head>
<body class="bg-gray-100">
    <!-- Navigation -->
    {{template "nav.tpl" .}}

    <div class="container mx-auto py-8">

        <!-- Property Grid -->
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
            {{range .Hotels}}
            <div class="property-card">
                <!-- Image container with a fixed height -->
                <div class="image-container relative">
                    <img src="{{index .ImageURLs 0}}" alt="{{.HotelName}}" class="w-full h-full object-cover">
                </div>
                <div class="content p-4">
                    <!-- Hotel name clickable -->
                    <div class="flex justify-between items-start mb-2">
                        <a href="/hotel-details?hotel_id={{.HotelID}}" class="text-blue-500 hover:underline text-lg font-semibold">{{.HotelName}}</a>
                        <div class="rating-badge text-sm bg-blue-600 text-white py-1 px-3 rounded">
                            <span>{{.Rating}}</span> <span class="ml-1">({{.ReviewCount}} reviews)</span>
                        </div>
                    </div>
                    <!-- Location -->
                    <div class="container">
                        <div class="flex justify-between items-center mt-2">
                            <!-- First column: City and Neighborhood -->
                            <div class="text-gray-600 text-sm">
                                <a href="/hotels?location={{.City}}" class="text-blue-500 hover:underline">{{.City}}</a> > 
                                <a href="/hotels?location={{.Neighborhood}}" class="text-blue-500 hover:underline">{{.Neighborhood}}</a>
                            </div>
                            <!-- Second column: Hotel Type -->
                            <div class="text-sm">
                                <p>{{.Type}}</p>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Amenities -->
                    <div class="amenities flex flex-wrap gap-2 mt-3">
                        {{range .Amenities}}
                        <span class="amenity bg-gray-200 py-1 px-3 rounded-full text-xs text-gray-700">{{.}}</span>
                        {{end}}
                    </div>
                    <!-- Price and View Availability button -->
                    <div class="flex justify-between items-center mt-4">
                        <div class="price text-xl font-bold">{{.Price}}</div>
                        <a href="#" class="view-availability-btn px-6 py-2 bg-green-600 text-white rounded-md text-sm hover:bg-green-700 transition-colors">View Availability</a>
                    </div>
                </div>
            </div>
            {{end}}
        </div>
    </div>
</body>
</html>
