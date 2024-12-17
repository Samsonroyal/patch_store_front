# Store_front App

This is a Flutter application that displays a list of products and allows users filter products by
categories and sort them by price. The data is fetched from the [Fake Store Api](https://fakestoreapi.com )


## Features:
- Displays a list of products fetched from the Fake Store API.
- Allows users to filter products by categories.
- Allows users to sort products by price (ascending and descending).
- Displays products in a staggered grid view for a dynamic and visually appealing layout.

# Prerequisites
- The Flutter SDK has to be installed
- Dart SDK has to be installed
- Android Studio or VS Code with the Flutter plugin
- An Android Emulator or a physical device to run the app

# How to get Started
- Clone the repository [here](https://github.com/Obehi234/Patch_Test_Store.git)
- Navigate to the project director via your terminal (cd patch_store_app)
- Install the necessary packages (flutter pub get)
- Run the app (flutter run)

# Processes Implemented

- # API Integration
    - The store fetches product data from the Fake Store API, fetching a list of 50 random products.
    - Each product has its details as defined in the Product Data Class - Product title, category, price and image.

- # Filtering and Sorting
 -The app has also been configured to handle sorting in various ways :
  - Sorting by highest price (By clicking on the button with text ["By Highest Price"])
  - Sorting by lowest price which re-arranges the product list from lowest to highest price
  - Sorting by category
