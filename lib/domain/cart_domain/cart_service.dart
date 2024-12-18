
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/cart.dart';

class CartService {
  final http.Client client;

  CartService({required this.client});

  Future<List<CartItem>> fetchCartItems() async {
    final response = await client.get(Uri.parse('https://fakestoreapi.com/carts'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => CartItem.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cart items');
    }
  }
}
