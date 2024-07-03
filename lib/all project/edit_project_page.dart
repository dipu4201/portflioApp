import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/main_controller.dart';
import '../models/project.dart';

class EditProjectPage extends StatelessWidget {
  final Project project;
  final int index;

  final MainController mainController = Get.find();

  EditProjectPage({required this.project, required this.index});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = project.title;
    descriptionController.text = project.description;
    imageController.text = project.image;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Project'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: imageController,
              decoration: InputDecoration(labelText: 'Image Path'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Project updatedProject = Project(
                  title: titleController.text,
                  description: descriptionController.text,
                  image: imageController.text,
                );
                mainController.updateProject(index, updatedProject);
                Get.back();
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
