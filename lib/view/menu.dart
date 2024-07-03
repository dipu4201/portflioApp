import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/dartsoft.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Get.toNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.android_outlined), // You can change the icon as needed
            title: Text('Services'),
            onTap: () {
              Get.toNamed('/our-services');
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('Contact'),
            onTap: () {
              Get.toNamed('/contact');
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              Get.toNamed('/about');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Get.toNamed('/settings');
            },
          ),
        ],
      ),
    );
  }
}
