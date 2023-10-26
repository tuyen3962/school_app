import 'package:flutter/cupertino.dart';
import 'package:school_web_management/common/model/teacher.dart';
import 'package:school_web_management/common/service/base_service.dart';

class TeachersController {
  final teachers = <Teacher>[];
  final teacherNotifier = ValueNotifier<int>(0);
  final isLoading = ValueNotifier<bool>(false);

  TeachersController() {
    initialize();
  }

  dispose() {
    teacherNotifier.dispose();
  }

  initialize() async {
    isLoading.value = true;
    try {
      final result = await BaseService.instance.restApi.getWorkingTeachers();
      if (result.data != null) {
        print(result.data);
      }
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }
}
