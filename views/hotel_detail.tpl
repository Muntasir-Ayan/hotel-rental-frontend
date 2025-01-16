<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{.Hotel.HotelName}}</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/static/css/hotel_detail.css">
</head>
<body class="bg-gray-100">
    <!-- Header -->
    {{template "nav.tpl" .}}

    <div class="container mx-auto py-8 px-4">

        <!-- Breadcrumbs -->
        <div class="breadcrumb mb-4">
            <a href="/" class="text-blue-600 hover:underline">Home</a> > 
            <a href="/" class="text-blue-600 hover:underline">USA</a> > 
            <a href="/hotels?location={{.City}}" class="text-blue-600 hover:underline">{{.Hotel.City}}</a> > 
            <a href="/hotels?location={{.Neighborhood}}" class="text-blue-600 hover:underline">{{.Hotel.Neighborhood}}</a>
        </div>

        <!-- Property Details -->
        <div id="propertyDetails">
            <h1 class="text-3xl font-bold mb-4">{{.Hotel.HotelName}}</h1>

            <div class="flex items-center mb-6">
                <div class="bg-blue-900 text-white px-3 py-1 rounded mr-4">
                    {{.Hotel.Rating}} ({{.Hotel.ReviewCount}} Reviews)
                </div>
                <span class="text-gray-600">{{.Hotel.Location}}</span>
            </div>

            <!-- Property Features -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
                <div class="flex items-center">
                    <svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path>
                    </svg>
                    <span>{{.Hotel.Bedrooms}} Bedrooms</span>
                </div>
                <div class="flex items-center">
                    <svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path d="M4 4v16a2 2 0 002 2h12a2 2 0 002-2V4"></path>
                    </svg>
                    <span>{{.Hotel.Bathrooms}} Bathrooms</span>
                </div>
                <div class="flex items-center">
                    <svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path>
                    </svg>
                    <span>{{.Hotel.Guests}} Guests</span>
                </div>
            </div>

            <!-- Hotel Images Gallery -->
            <div class="flex flex-wrap -mx-2 mb-8 image-gallery">
                {{range .Hotel.ImageURLs}}
                    <div class="w-full sm:w-1/2 md:w-1/4 p-2">
                        <img src="{{.}}" alt="Hotel Image" class="w-full h-48 object-cover rounded transition-opacity hover:opacity-90 cursor-pointer">
                    </div>
                {{end}}
            </div>

            <!-- Description -->
            <div class="bg-white rounded-lg p-6 mb-8 shadow-sm">
                <h2 class="text-2xl font-bold mb-4">Description</h2>
                <p class="text-gray-700 leading-relaxed">{{.Hotel.Description}}</p>
            </div>

            <!-- Amenities -->
            <div class="bg-white rounded-lg p-6 mb-8 shadow-sm">
                <h2 class="text-2xl font-bold mb-4">Amenities</h2>
                <div class="flex flex-wrap">
                    {{range .Hotel.Amenities}}
                    <span class="px-3 py-1 bg-gray-100 rounded-full text-sm mr-2 mb-2 inline-block">{{.}}</span>
                    {{end}}
                </div>
            </div>

            <!-- Price and Booking -->
            <div class="bg-white rounded-lg p-6 shadow-sm">
                <div class="flex justify-between items-center">
                    <div class="text-3xl font-bold">{{.Hotel.Price}}</div>
                    <button class="px-8 py-3 bg-green-500 text-white rounded-lg hover:bg-green-600 transition-colors">
                        Book Now
                    </button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
