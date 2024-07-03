import 'package:get/get.dart';
import '../models/project.dart';

class MainController extends GetxController with SingleGetTickerProviderMixin {
  var projects = <Project>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void addProject(Project project) {
    projects.add(project);
  }

  void updateProject(int index, Project updatedProject) {
    projects[index] = updatedProject;
  }
}
