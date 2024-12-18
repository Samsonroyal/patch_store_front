import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String productName;
  final String productImageUrl;
  final double productPrice;
  final String productCategory;
  final String productDescription;

  const ProductItem({
    super.key,
    required this.productName,
    required this.productImageUrl,
    required this.productPrice,
    required this.productCategory,
    required this.productDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4), // Added Border radius of 4px
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            child: Image.network(
              productImageUrl,
              height: 100, // Fixed image height
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Spacer to handle padding inside card
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Category
                Text(
                  productCategory.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                // Product Name
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                // Product Description
                Text(
                  productDescription,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF7C7C7C),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                // Product Price
                Text(
                  '\$${productPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
