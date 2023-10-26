// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BaseResponse {
  final String? status;
  final dynamic result;
  final dynamic data;
  final String? message;
  final String? token;

  BaseResponse({
    this.status,
    this.result,
    required this.data,
    this.message,
    this.token,
  });

  List<T> parseList<T>(T Function(Map<String, dynamic> map) jsonConvertor) {
    List items = data;
    return items.map((element) {
      return jsonConvertor(element);
    }).toList();
  }

  T parse<T>(T Function(Map<String, dynamic> map) jsonConvertor) {
    return jsonConvertor(data);
  }

  BaseResponse copyWith({
    String? status,
    dynamic? result,
    dynamic? data,
    String? message,
    String? token,
  }) {
    return BaseResponse(
      status: status ?? this.status,
      result: result ?? this.result,
      data: data ?? this.data,
      message: message ?? this.message,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'result': result,
      'data': data,
      'message': message,
      'token': token,
    };
  }

  factory BaseResponse.fromJson(Map<String, dynamic> map) {
    return BaseResponse(
      status: map['status'] != null ? map['status'] as String : null,
      result: map['result'] as dynamic,
      data: map['data'] as dynamic,
      message: map['message'] != null ? map['message'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }
}
