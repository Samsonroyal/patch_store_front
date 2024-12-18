import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../domain/cart_domain/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    cartProvider.fetchCartItems();

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text(
          "Cart",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<CartProvider>(
        builder: (context, provider, child) {
          final cartItems = provider.cartItems;

          if (cartItems.isEmpty) {
            return const Center(child: Text("Your cart is empty"));
          }

          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final cartItem = cartItems[index];
              return ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: Text(cartItem.title),
                subtitle:
                    Text('Price: \$${cartItem.price} x ${cartItem.quantity}'),
                trailing: Text(
                    '\$${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}'),
              );
            },
          );
        },
      ),
    );
  }
}
