# Property Frontend

This is a frontend application for displaying property details, built using the Beego framework.

## Project Structure
- `controllers/property.go`: Contains the controller logic for fetching and displaying property details.
- `routers/router.go`: Defines the routing rules for the application.
- `views/index.tpl`: Template for displaying the list of properties.
- `views/details.tpl`: Template for displaying the details of a single property.
- `main.go`: The entry point of the application.

## Getting Started

### Prerequisites

- Go 1.16+ installed
- Beego framework installed: `go get -u github.com/beego/beego/v2`

### Running the Application

1. **Clone the repository**:

  ```bash
    git clone https://github.com/Muntasir-Ayan/hotel-rental-frontend.git
    cd hotel-rental-frontend
  ```
2. **Install dependencies**:
   ``` bash
     go mod tidy
   ```
3. **Run Application**:
   ``` bash
     bee run
   ```
Open your browser and navigate to http://localhost:5000 to view the list of properties.
