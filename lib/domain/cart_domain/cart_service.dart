import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/cart.dart';

class CartService {
  final http.Client client;

  CartService({required this.client});

  Future<List<CartItem>> fetchCartItems() async {
    final response =
        await client.get(Uri.parse('https://fakestoreapi.com/carts'));

    if (response.statusCode == 200) {
      List<dynamic> cartData = json.decode(response.body);

      List<CartItem> cartItems = [];
      for (var cart in cartData) {
        for (var product in cart['products']) {
          var productResponse = await client.get(Uri.parse(
              'https://fakestoreapi.com/products/${product['productId']}'));
          if (productResponse.statusCode == 200) {
            var productData = json.decode(productResponse.body);
            cartItems.add(CartItem.fromJson({
              'productId': product['productId'],
              'title': productData['title'],
              'price': productData['price'],
              'quantity': product['quantity'],
              'image': productData['image'],
            }));
          } else {
            throw Exception('Failed to load product details');
          }
        }
      }

      return cartItems;
    } else {
      throw Exception('Failed to load cart items');
    }
  }
}
