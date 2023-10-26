import 'package:flutter/material.dart';
import 'package:school_web_management/ui/teachers/teachers_controller.dart';

class TeachersPage extends StatefulWidget {
  const TeachersPage({super.key});

  @override
  State<TeachersPage> createState() => _TeachersPageState();
}

class _TeachersPageState extends State<TeachersPage> {
  final TeachersController controller = TeachersController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text('techer')],
    );
  }
}
