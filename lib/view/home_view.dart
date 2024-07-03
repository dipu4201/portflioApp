import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:testing2/myServicesPage/web_development_page.dart';
import '../all project/edit_project_page.dart';
import '../all project/project_details_page.dart';
import '../controller/main_controller.dart';
import '../models/project.dart';
import 'menu.dart';

class HomePage extends StatelessWidget {
  final MainController mainController = Get.put(MainController());

  HomePage() {
    mainController.addProject(Project(
        title: 'Foddie App',
        description: 'Foodie apps enhance your dining experience by providing user-generated reviews',
        image: 'assets/img.png'));

    mainController.addProject(Project(
        title: 'Pizza App',
        description: 'Pizza apps make ordering your favorite pizza quick and convenient',
        image: 'assets/project2.png'));

    mainController.addProject(Project(
        title: 'Taxi Booking App',
        description: 'Taxi booking apps provide the convenience of hailing a ride anytime',
        image: 'assets/Project3.png'));

    mainController.addProject(Project(
        title: 'Doctor App',
        description: 'Doctor apps offer easy access to medical consultations and health services from the comfort of your home',
        image: 'assets/project4.png'));

    mainController.addProject(Project(
        title: 'Car services App',
        description: 'Car service apps provide convenience by enabling easy booking of maintenance and repair services',
        image: 'assets/project5.png'));

    mainController.addProject(Project(
        title: 'Crypto App',
        description: 'Cryptocurrency apps offer enhanced security with multi-layered encryption and quick, low-fee transaction',
        image: 'assets/project6.png'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio App'),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              Get.toNamed('/about');
            },
          ),
        ],
      ),
      drawer: Menu(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/mypic.png'),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Delower Hossain',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'App Developer Android & iOS',
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'My Projects',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Container(
                height: 200,
                child: Obx(
                      () => CarouselSlider.builder(
                    itemCount: mainController.projects.length,
                    itemBuilder: (context, index, realIndex) {
                      Project project = mainController.projects[index];
                      return GestureDetector(
                        onTap: () {
                          // Navigate to project details page
                          Get.to(ProjectDetailsPage(project: project));
                        },
                        child: Card(
                          child: Container(
                            width: 300,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    project.image,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                                ListTile(
                                  title: Text(project.title),
                                  subtitle: Text(project.description),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 200,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 84),
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red, // text color
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: Icon(Icons.shopping_cart),
                  label: Text('Shop Now'),
                  onPressed: () {
                    // Navigate to shopping page or cart page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => WebDevelopmentPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
