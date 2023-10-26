import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:school_web_management/common/model/teacher.dart';
import 'package:school_web_management/common/repo/storage_repo.dart';
import 'package:school_web_management/common/service/base_service.dart';
import 'package:school_web_management/extension/extension.dart';
import 'package:school_web_management/routes/app_routes_name.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userName = TextEditingController();
  final password = TextEditingController();
  final service = BaseService.instance;

  @override
  void dispose() {
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(12),
              width: context.width(300),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text('Admin login'),
                  const SizedBox(height: 12),
                  _buildTextField(userName),
                  const SizedBox(height: 12),
                  _buildTextField(password),
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: _handleLogin,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(12)),
                      child: Text('Login'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildTextField(TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(border: InputBorder.none),
      ),
    );
  }

  _handleLogin() async {
    try {
      final result = await BaseService.instance.adminLogin('GV001', 'manh1234');
      final data = await http
          .post(Uri.parse('http://localhost:3000/admin/login'), body: {
        'teacherCode': 'GV001',
        'password': 'manh1234',
      });
      print(result);
      print(data.body);
      // final data = await service.restApi.login({
      //   'teacherCode': 'GV001',
      //   'password': 'manh1234',
      // });
      // if (data.token != null) {
      //   final teacher = Teacher.fromJson(data.data as Map<String, dynamic>);
      //   await Future.wait([
      //     StorageRepo.instance.saveToken(data.token ?? ''),
      //     StorageRepo.instance.saveUserData(jsonEncode(teacher.toJson()))
      //   ]);
      //   Navigator.pushReplacementNamed(context, AppRoutesName.HOME_PAGE);
      // }
    } catch (e) {
      print(e);
    }
  }
}
