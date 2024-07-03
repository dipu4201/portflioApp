// product.dart

class Product {
  final String title;
  final String description;
  final String price;
  final String discountedPrice;
  final String imagePath;

  Product({
    required this.title,
    required this.description,
    required this.price,
    required this.discountedPrice,
    required this.imagePath,
  });
}