import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/Product.dart';

class CartPage extends StatefulWidget {
  final List<Product> cartProducts;

  CartPage({required this.cartProducts});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double calculateTotalPrice() {
    double total = 0.0;
    for (var product in widget.cartProducts) {
      // Extract numeric part from the price string
      String priceString = product.price.replaceAll(RegExp(r'[^0-9.]'), '');
      // Parse the extracted numeric part to double
      double originalPrice = double.parse(priceString);
      // Calculate the discounted price
      double discountedPrice = originalPrice * 0.8;
      // Add the discounted price to the total
      total += discountedPrice;
    }
    return total;
  }

  String formatTotalPrice(double totalPrice) {
    return totalPrice.toStringAsFixed(totalPrice.truncateToDouble() == totalPrice ? 0 : 2);
  }

  void showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Service'),
          content: Text('Are you sure you want to delete this service?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  widget.cartProducts.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: widget.cartProducts.isNotEmpty
                  ? ListView.builder(
                itemCount: widget.cartProducts.length,
                itemBuilder: (context, index) {
                  final product = widget.cartProducts[index];

                  return GestureDetector(
                    onLongPress: () {
                      showDeleteDialog(context, index);
                    },
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                product.imagePath,
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 24),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    product.description,
                                    style: TextStyle(fontSize: 16),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Price: ${product.price}',
                                    style: TextStyle(
                                      decoration:
                                      TextDecoration.lineThrough,
                                      color: Colors.grey,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Discounted Price: \$${(double.parse(product.price.replaceAll(RegExp(r'[^0-9.]'), '')) * 0.8).toStringAsFixed(2)}',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
                  : Center(
                child: Text(
                  'Nothing Here. Buy Any Services',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            if (widget.cartProducts.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      double totalPrice = calculateTotalPrice();
                      String formattedTotalPrice = formatTotalPrice(totalPrice);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Stack(
                            children: [
                              // Background blur
                              BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: Container(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                              // Dialog
                              AlertDialog(
                                title: Text('Checkout'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Selected Products: ${widget.cartProducts.length}',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Total Price: \$${formattedTotalPrice}',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    child: Text(
                                      'Close',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.red,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      // Implement payment logic here
                                      // For example, navigate to payment screen
                                    },
                                    child: Text('Payment'),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                    ),
                    child: Text('Checkout'),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
