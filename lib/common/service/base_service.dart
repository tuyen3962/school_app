import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:school_web_management/common/model/base_response.dart';
import 'package:school_web_management/common/model/teacher.dart';
import 'package:school_web_management/common/repo/storage_repo.dart';
import 'package:school_web_management/common/service/base_rest_api.dart';
import 'package:school_web_management/common/service/rest_api.dart';
import 'package:school_web_management/common/service/rest_api_route.dart';

class BaseService extends BaseRestAPI {
  static final BaseService instance = BaseService._();

  BaseService._() {
    onInit();
  }

  final dio = Dio();
  late BaseRestApi restApi;

  void onInit() {
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    //   return client;
    // };
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
          responseHeader: false,
          responseBody: true,
          request: true,
          requestBody: true));
    }
    // logPrint: NetUtils.printCustom));
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      dio.interceptors.requestLock.lock();

      final token = StorageRepo.instance.getToken();

      // if (token.isNotEmpty) {
      //   options.headers['Authorization'] = token;
      // }
      options.headers['content-type'] = 'application/json';
      options.headers['Access-Control-Allow-Origin'] = '*';
      options.headers['Access-Control-Allow-Credentials'] = true;
      if (kDebugMode) {
        print(options.headers);
      }

      handler.next(options);
    }));
    restApi = BaseRestApi(dio);
  }

  Future<BaseResponse?> adminLogin(String teacherCode, String pass) async {
    try {
      final response = await post(RestApiRoute.adminLogin,
          body: {'teacherCode': teacherCode, 'password': pass});
      if (response != null) {
        return response;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
