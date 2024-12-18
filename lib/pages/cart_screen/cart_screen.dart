import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/cart_domain/cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cartProvider = Provider.of<CartProvider>(context, listen: false);

      if (cartProvider.cartItems.isEmpty && !cartProvider.isLoading) {
        cartProvider.fetchCartItems();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<CartProvider>(builder: (context, provider, child) {
        final cartItems = provider.cartItems;

        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (cartItems.isEmpty) {
          return const Center(child: Text("Your cart is empty"));
        }

        return ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            final cartItem = cartItems[index];
            return ListTile(
              leading: ClipOval(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(8),
                  child: cartItem.image != null && cartItem.image!.isNotEmpty
                      ? Image.network(
                          cartItem.image!,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                ),
              ),
              title: Text(cartItem.title),
              subtitle:
                  Text('Price: \$${cartItem.price} x ${cartItem.quantity}'),
              trailing: Text(
                  '\$${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}'),
            );
          },
        );
      }),
    );
  }
}
