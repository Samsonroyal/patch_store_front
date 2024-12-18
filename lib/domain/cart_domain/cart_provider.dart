import 'package:flutter/cupertino.dart';

import '../../model/cart.dart';
import 'cart_service.dart';

class CartProvider with ChangeNotifier {
  final CartService cartService;

  List<CartItem> _cartItems = [];

  CartProvider({required this.cartService});

  List<CartItem> get cartItems => _cartItems;

  Future<void> fetchCartItems() async {
    try {
      _cartItems = await cartService.fetchCartItems();
      notifyListeners();
    } catch (e) {
      print('Error fetching cart items: $e');
    }
  }
}
