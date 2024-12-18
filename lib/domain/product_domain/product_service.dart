
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/product.dart';

class ProductService {
  final http.Client client;

  ProductService({required this.client});

  Future<List<Product>> fetchProducts() async {
    List<Product> allProducts = [];
    int page = 1;
    int limit = 20;

    while (allProducts.length < 50) {
      final response = await client.get(
        Uri.parse('https://fakestoreapi.com/products?limit=$limit&page=$page'),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        allProducts.addAll(data.map((json) => Product.fromJson(json)).toList());
        if (allProducts.length >= 50) {
          break;
        }
        page++;
      } else {
        throw Exception('Failed to load products');
      }
    }

    return allProducts;
  }

  List<String> getCategories(List<Product> products) {
    Set<String> categoriesSet = {};
    for (var product in products) {
      categoriesSet.add(product.category);
    }
    return categoriesSet.toList();
  }
}





