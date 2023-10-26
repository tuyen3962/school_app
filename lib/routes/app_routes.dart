import 'package:flutter/material.dart';
import 'package:school_web_management/common/constant/storage_key.dart';
import 'package:school_web_management/common/repo/storage_repo.dart';
import 'package:school_web_management/main.dart';
import 'package:school_web_management/routes/app_routes_name.dart';
import 'package:school_web_management/ui/home/home_page.dart';
import 'package:school_web_management/ui/login/login_page.dart';

class AppRoutes {
  static String get initialRoute {
    // if (StorageRepo.instance.getToken().isNotEmpty) {
    //   return AppRoutesName.HOME_PAGE;
    // } else {
    return AppRoutesName.LOGIN_PAGE;
    // }
  }

  static Map<String, Widget Function(BuildContext context)> onGenerateRoute() {
    return {
      AppRoutesName.LOGIN_PAGE: (context) => LoginPage(),
      AppRoutesName.HOME_PAGE: (context) => HomePage()
    };
  }
}
