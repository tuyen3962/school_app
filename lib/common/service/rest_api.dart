import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:school_web_management/common/model/base_response.dart';

part 'rest_api.g.dart';

@RestApi(baseUrl: 'http://localhost:3000')
abstract class BaseRestApi {
  factory BaseRestApi(Dio dio, {String baseUrl}) = _BaseRestApi;

  @POST('/admin/login')
  Future<BaseResponse> login(@Body() Map<String, dynamic> queries);

  @POST("/admin/add")
  Future<BaseResponse> addTeacher(@Body() Map<String, dynamic> queries);

  @GET('/admin/profile')
  Future<BaseResponse> getProfile(@Body() Map<String, dynamic> queries);

  @PUT('/admin/update/teacher/{id}')
  Future<BaseResponse> updateTeacher(@Path() id);

  @GET('/admin/working-teachers')
  Future<BaseResponse> getWorkingTeachers();

  @GET('/admin/retired-teachers')
  Future<BaseResponse> getRetiredTeachers();

  @POST('/teacher/retired-teachers')
  Future<BaseResponse> recoverTeacherAcc(
      @Queries() Map<String, dynamic> queries);

  @POST('/teacher/reset-password')
  Future<BaseResponse> resetTeacherPassword(
      @Queries() Map<String, dynamic> queries);

  @DELETE("/admin/delete-teacher/{id}")
  Future<BaseResponse> deleteTeacher(@Path() id);
}
