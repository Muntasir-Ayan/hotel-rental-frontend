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
    <style>
        /* Set a fixed height for the property cards */
        .property-card {
            height: 500px; /* Adjust to the desired height */
            display: flex;
            flex-direction: column;
            border-radius: 8px;
            overflow: hidden;
            background-color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        /* Ensure the image takes up the right amount of space in the card */
        .property-card .image-container {
            height: 250px; /* Fixed height for the image */
            overflow: hidden;
        }

        /* Ensures the content stays at the bottom of the card */
        .property-card .content {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 16px;
        }

        /* Hotel Name Styling */
        .property-card h5 {
            font-size: 18px;
            font-weight: 600;
        }

        /* Rating and other details */
        .rating-badge {
            background-color: #007bff;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 14px;
        }

        /* Ensure that amenities are spaced properly */
        .amenities {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-top: 10px;
        }

        .amenity {
            padding: 5px 10px;
            background-color: #f0f0f0;
            border-radius: 20px;
            font-size: 14px;
        }

        /* Button Styling */
        .view-availability-btn {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .view-availability-btn:hover {
            background-color: #218838;
        }

        /* Price Styling */
        .price {
            font-size: 22px;
            font-weight: bold;
        }

        /* To handle large description and overflow */
        .content > p {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        /* Link styling */
        a {
            text-decoration: none;
        }
    </style>
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
                        <p class="text-gray-600 mb-2">
                            <a href="#" class="text-blue-500 hover:underline">{{.City}}</a> > 
                            <a href="#" class="text-blue-500 hover:underline">{{.Neighborhood}}</a>
                        </p>
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
