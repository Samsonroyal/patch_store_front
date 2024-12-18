
class CartItem {
  final int id;
  final int productId;
  final int quantity;
  final double price;
  final String title;

  CartItem({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.title,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      productId: json['productId'],
      quantity: json['quantity'],
      price: json['price'],
      title: json['title'],
    );
  }
}
