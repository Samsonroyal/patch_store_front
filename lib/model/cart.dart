class CartItem {
  final String title;
  final double price;
  final int quantity;
  final int productId;
  final String? image;

  CartItem({
    required this.productId,
    required this.title,
    required this.price,
    required this.quantity,
    this.image,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['productId'],
      title: json['title'] ?? 'No title',
      price: (json['price'] != null)
          ? double.tryParse(json['price'].toString()) ?? 0.0
          : 0.0,
      quantity: json['quantity'] ?? 0,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'quantity': quantity,
      'image': image,
    };
  }
}
