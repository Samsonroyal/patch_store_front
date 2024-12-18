import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'domain/cart_domain/cart_provider.dart';
import 'domain/cart_domain/cart_service.dart';
import 'domain/product_domain/product_provider.dart';
import 'domain/product_domain/product_service.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(
              productService: ProductService(client: http.Client())),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              CartProvider(cartService: CartService(client: http.Client())),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Test Store'),
      ),
    );
  }
}
