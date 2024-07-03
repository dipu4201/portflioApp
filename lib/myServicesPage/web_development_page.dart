import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/Product.dart';
import 'cart_page.dart';

class WebDevelopmentPage extends StatefulWidget {
  @override
  _WebDevelopmentPageState createState() => _WebDevelopmentPageState();
}

class _WebDevelopmentPageState extends State<WebDevelopmentPage> {
  int cartCount = 0;
  List<Product> cartProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Development'),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // Navigate to CartPage and pass the cartProducts list
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(cartProducts: cartProducts),
                    ),
                  );
                },
              ),
              if (cartCount > 0)
                Positioned(
                  right: 11,
                  top: 11,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      '$cartCount',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Our Web Development Services',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildServiceItem(
                context,
                Product(
                  title: 'Basic Website',
                  description: 'Perfect for small businesses',
                  price: '\$1000',
                  discountedPrice: '\$800 (20% off)',
                  imagePath: 'assets/image/basic.png',
                ),
              ),
              SizedBox(height: 16),
              _buildServiceItem(
                context,
                Product(
                  title: 'E-commerce Website',
                  description: 'Sell products online',
                  price: '\$2000',
                  discountedPrice: '\$1600 (20% off)',
                  imagePath: 'assets/image/ecommers.png',
                ),
              ),
              SizedBox(height: 16),
              _buildServiceItem(
                context,
                Product(
                  title: 'Custom Web Application',
                  description: 'Tailored solutions',
                  price: '\$3000',
                  discountedPrice: '\$2400 (20% off)',
                  imagePath: 'assets/image/custom.png',
                ),
              ),
              SizedBox(height: 16),
              _buildServiceItem(
                context,
                Product(
                  title: 'Web Android & iOS Application',
                  description: 'Large scale projects',
                  price: '\$5000',
                  discountedPrice: '\$4000 (20% off)',
                  imagePath: 'assets/image/web_ios_android.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceItem(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () {
        // Show dialog with product details
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Stack(
              children: [
                // Blur background effect
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(color: Colors.black.withOpacity(0.5)),
                ),
                // AlertDialog
                AlertDialog(
                  title: Text(product.title),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        product.imagePath,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 16),
                      Text(product.description),
                      SizedBox(height: 8),
                      Text(
                        'Price: ${product.price}',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Discounted Price: ${product.discountedPrice}',
                        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Close'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('Buy'),
                      onPressed: () {
                        // Add product to cart and close dialog
                        setState(() {
                          cartCount += 1;
                          cartProducts.add(product);
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 32,  // Adjust width as needed
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
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'Price: ${product.price}',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 16),
                          Flexible(
                            child: Text(
                              'Discounted Price: ${product.discountedPrice}',
                              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}