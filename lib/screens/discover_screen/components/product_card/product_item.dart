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
    return ClipRRect(
      borderRadius: BorderRadius.circular(4), // Ensure no overflow beyond card
      child: Card(
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            SizedBox(
              height: 100, // Slightly smaller image
              width: double.infinity,
              child: Image.network(
                productImageUrl,
                fit: BoxFit.cover,
              ),
            ),
            // Content Section
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly, // Space out elements
                  children: [
                    // Category
                    Flexible(
                      child: Text(
                        productCategory.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 9,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Product Name
                    Flexible(
                      child: Text(
                        productName,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Description
                    Flexible(
                      child: Text(
                        productDescription,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Price
                    Text(
                      '\$${productPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
