import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:school_web_management/common/model/base_response.dart';
import 'package:http/http.dart' as http;
import 'package:school_web_management/common/repo/storage_repo.dart';
import 'package:school_web_management/common/service/exception.dart';

abstract class BaseRestAPI {
  Map<String, String>? _getHeader() {
    final header = <String, String>{};
    // header['Content-Type'] = 'application/json';
    // header['Access-Control-Allow-Origin'] = '*';
    // header['Access-Control-Allow-Credentials'] = 'true';
    // header['User-Agent'] = 'school_web_management/1.0';
    final token = StorageRepo.instance.getToken();
    if (token.isNotEmpty) {
      header['Authorization'] = token;
    }

    if (kDebugMode) {
      print(header);
    }

    return header.isEmpty ? null : header;
  }

  Future<BaseResponse?> get(
    String url, {
    Map<String, dynamic>? queris,
  }) async {
    try {
      var _url = url;
      if ((queris ?? {}).isNotEmpty) {
        _url += '?';
        for (final key in queris!.keys) {
          _url += '$key=${queris[key]}&';
        }
      }
      if (kDebugMode) {
        print(_url);
      }
      final response = await http.get(Uri.parse(_url), headers: _getHeader());
      if (response.statusCode == 200) {
        final baseResponse = BaseResponse.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
        return baseResponse;
      } else if (response.statusCode == 500 || response.statusCode == 400) {
        throw ServerError();
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<BaseResponse?> post(
    String url, {
    Map<String, dynamic>? queris,
    Map<String, dynamic>? body,
  }) async {
    try {
      var _url = url;
      if ((queris ?? {}).isNotEmpty) {
        _url += '?';
        for (final key in queris!.keys) {
          _url += '$key=${queris[key]}&';
        }
      }
      if (kDebugMode) {
        print(_url);
        print('body: ${body ?? {}}');
      }
      final response = await http.post(Uri.parse(_url), body: body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final baseResponse = BaseResponse.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
        return baseResponse;
      } else if (response.statusCode == 500 || response.statusCode == 400) {
        throw ServerError();
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<BaseResponse?> put(
    String url, {
    Map<String, dynamic>? queris,
    Map<String, dynamic>? body,
  }) async {
    try {
      var _url = url;
      if ((queris ?? {}).isNotEmpty) {
        _url += '?';
        for (final key in queris!.keys) {
          _url += '$key=${queris[key]}&';
        }
      }
      if (kDebugMode) {
        print(_url);
        print('body: ${body ?? {}}');
      }
      final response =
          await http.put(Uri.parse(_url), headers: _getHeader(), body: body);
      if (response.statusCode == 200) {
        final baseResponse = BaseResponse.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
        return baseResponse;
      } else if (response.statusCode == 500 || response.statusCode == 400) {
        throw ServerError();
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
