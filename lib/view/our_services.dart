import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../myServicesPage/consultancy_page.dart';
import '../myServicesPage/mobile_app_development_page.dart';
import '../myServicesPage/ui_ux_design_page.dart';
import '../myServicesPage/web_development_page.dart';

class OurServicesPage extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {
      'title': 'Web Development',
      'description': 'Building responsive and modern websites.',
      'icon': FontAwesomeIcons.globe,
      'page': WebDevelopmentPage(),
    },
    {
      'title': 'Mobile App Development',
      'description': 'Creating cross-platform mobile applications.',
      'icon': FontAwesomeIcons.mobileAlt,
      'page': MobileAppDevelopmentPage(),
    },
    {
      'title': 'UI/UX Design',
      'description': 'Designing user interfaces and user experiences.',
      'icon': FontAwesomeIcons.palette,
      'page': UiUxDesignPage(),
    },
    {
      'title': 'Consultancy',
      'description': 'Providing expert advice to improve your business.',
      'icon': FontAwesomeIcons.userTie,
      'page': ConsultancyPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Services'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return ServiceCard(service: service);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatefulWidget {
  final Map<String, dynamic> service;

  const ServiceCard({Key? key, required this.service}) : super(key: key);

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: _isHovered ? (Matrix4.identity()..scale(1.05)) : Matrix4.identity(),
        child: AnimatedOpacity(
          opacity: _isHovered ? 1.0 : 0.9,
          duration: Duration(milliseconds: 300),
          child: Card(
            elevation: _isHovered ? 10 : 5,
            margin: const EdgeInsets.symmetric(vertical: 12.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              leading: FaIcon(widget.service['icon'], size: 40),
              title: Text(
                widget.service['title']!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.blueAccent,
                ),
              ),
              subtitle: Text(
                widget.service['description']!,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => widget.service['page'],
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
