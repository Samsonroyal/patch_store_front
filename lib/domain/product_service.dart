
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/product.dart';

class ProductService {
  final http.Client client;

  ProductService({required this.client});

  Future<List<Product>> fetchProducts() async {
    final response = await client.get(Uri.parse('https://fakestoreapi.com/products?limit=50'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  List<String> getCategories(List<Product> products) {
    Set<String> categoriesSet = {};
    for (var product in products) {
      categoriesSet.add(product.category);
    }
    return categoriesSet.toList();
  }
}

