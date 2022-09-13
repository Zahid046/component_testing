import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:component_testing/helper/utility.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class ApiController {
  Future<dynamic> commonPostWithoutToken({required String url, required Map<String, dynamic> body, required double? width, required BuildContext context, int? timer}) async {
    final http.Client client = http.Client();
    final Uri uri = Uri.parse(url);
    http.Response response;
    String _error = 'An Error Occurred';
    try {
      response = await client.post(
        uri,
        body: body,
        headers: {'app-role': 'customer'},
      ).timeout(
        Duration(seconds: timer ?? 30),
        onTimeout: () {
          _error = 'Connection time out';

          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(getSnackBar(context, width, 'Error', _error, Colors.red));
          throw TimeoutException('Connection time out');
        },
      );

      ll('response : ' + response.body.toString());
      return jsonDecode(response.body);
    } on SocketException {
      _error = 'No internet connection';

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(getSnackBar(context, width, 'Error', _error, Colors.red));
      return null;
    } catch (e) {
      log(e.toString());

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(getSnackBar(context, width, 'Error', _error, Colors.red));
      return null;
    } finally {
      client.close();
    }
  }

  //* info:: common get
  Future<dynamic> commonGet({required String? token, required String url, required BuildContext context, int? timer, double? width}) async {
    final http.Client client = http.Client();
    final Uri uri = Uri.parse(url);

    http.Response response;
    String _error = 'An Error Occurred';
    try {
      response = await client.get(uri, headers: {'Authorization': 'Bearer $token'}).timeout(
        Duration(seconds: timer ?? 30),
        onTimeout: () {
          _error = 'Connection time out';
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(getSnackBar(context, width, 'Error', _error, Colors.red));
          throw TimeoutException('Connection time out');
        },
      );

      ll('response : ' + response.body.toString());
      return jsonDecode(response.body);
    } on SocketException {
      _error = 'No internet connection';

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(getSnackBar(context, width, 'Error', _error, Colors.red));
      return null;
    } catch (e) {
      log(e.toString());

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(getSnackBar(context, width, 'Error', _error, Colors.red));
      return null;
    } finally {
      client.close();
    }
  }

  //* info:: common post with body and token
  Future<dynamic> commonPost({
    required String? token,
    required String url,
    required Map<String, dynamic> body,
    required double? width,
    required BuildContext context,
    int? timer,
  }) async {
    final http.Client client = http.Client();
    final Uri uri = Uri.parse(url);
    http.Response response;
    String _error = 'An Error Occurred';
    try {
      response = await client.post(uri, headers: {'Authorization': 'Bearer $token', 'app-role': 'customer'}, body: body).timeout(
        Duration(seconds: timer ?? 30),
        onTimeout: () {
          _error = 'Connection time out';

          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(getSnackBar(context, width, 'Error', _error, Colors.red));
          throw TimeoutException('Connection time out');
        },
      );

      ll('response : ' + response.body.toString());
      return jsonDecode(response.body);
    } on SocketException {
      _error = 'No internet connection';

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(getSnackBar(context, width, 'Error', _error, Colors.red));
      return null;
    } catch (e) {
      log(e.toString());

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(getSnackBar(context, width, 'Error', _error, Colors.red));
      return null;
    } finally {
      client.close();
    }
  }

  // dio post type of request
  Future<dynamic> commonPostWithBodyDio({
    required String? token,
    required String url,
    required Map<String, dynamic> body,
    required double? width,
    required BuildContext context,
    int? timer,
  }) async {
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['authorization'] = 'Bearer $token';
    dio.options.headers['app-role'] = 'customer';
    String _error = 'An Error Occurred';
    try {
      var response = await dio.post(url, data: body).timeout(
        Duration(seconds: timer ?? 30),
        onTimeout: () {
          _error = 'Connection time out';

          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(getSnackBar(context, width, 'Error', _error, Colors.red));
          throw TimeoutException('Connection time out');
        },
      );

      ll('response : ' + response.data.toString());
      return response.data;
    } on DioError catch (e) {
      if (e.error is SocketException) {
        _error = 'No internet connection';

        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(getSnackBar(context, width, 'Error', _error, Colors.red));
        return null;
      } else {
        log(e.toString());

        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(getSnackBar(context, width, 'Error', _error, Colors.red));
        return null;
      }
    } finally {
      //client.close();
    }
  }
}
