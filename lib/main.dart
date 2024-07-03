import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing2/theme/theme_data.dart';
import 'package:testing2/view/about_view.dart';
import 'package:testing2/view/contact_view.dart';
import 'package:testing2/view/home_view.dart';
import 'package:testing2/view/menu.dart';
import 'package:testing2/view/our_services.dart';
import 'package:testing2/view/settings_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: buildDarkTheme(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/about', page: () => AboutPage()),
        GetPage(name: '/settings', page: () => SettingsPage()),
        GetPage(name: '/our-services', page: () => OurServicesPage()),
        GetPage(name: '/contact', page: () => ContactPage()),
        GetPage(name: '/menu', page: () => Menu()),
      ],
    );
  }
}

