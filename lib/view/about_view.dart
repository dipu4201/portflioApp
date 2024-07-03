
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Me'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/mypic.png'),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Delower Hossain Dipu',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  'App Developer iOS & Android',
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.grey),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Biography',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'i am a full time Flutter Developer, i love my job, as a android app developer that\'s a good job.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Text(
                'Skills',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: [
                  Chip(label: Text('Flutter')),
                  Chip(label: Text('Dart')),
                  Chip(label: Text('Android')),
                  Chip(label: Text('Android Studio')),
                  Chip(label: Text('Problem Solving')),
                  Chip(label: Text('Git')),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Experience',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Software Developer at Alvy It Company'),
                subtitle: Text('June 2022 - Present\n- Key achievement: Developed important features for a major product.\n- Responsibilities: Lead developer in a team of 5.'),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Intern Developer at Ostad'),
                subtitle: Text('Jan 2022 - May 2023\n- Key achievement: Improved application performance by 25%.\n- Responsibilities: Assisted in development and bug fixes.'),
              ),
              SizedBox(height: 24),
              Text(
                'Education',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Computer Science Engineering'),
                subtitle: Text('University of Engineering\n2018 - 2022'),
              ),
              SizedBox(height: 24),
              Text(
                'Contact Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.email),
                title: Text('delowerdipu420@gmail.com'),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.phone),
                title: Text('+880 1739234769'),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.web),
                title: Text('Developerdipu.com'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}