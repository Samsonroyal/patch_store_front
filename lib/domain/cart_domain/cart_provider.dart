import 'package:flutter/cupertino.dart';

import '../../model/cart.dart';
import 'cart_service.dart';

class CartProvider with ChangeNotifier {
  final CartService cartService;

  List<CartItem> _cartItems = [];
  bool _isLoading = false;

  CartProvider({required this.cartService});

  List<CartItem> get cartItems => _cartItems;

  bool get isLoading => _isLoading;

  Future<void> fetchCartItems() async {
      _isLoading = true;
      notifyListeners();

      try {
      _cartItems = await cartService.fetchCartItems();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
        print('Error fetching cart items: $e');
      } finally{ _isLoading = false;
      _isLoading = false;
      notifyListeners();
    }
  }
}
