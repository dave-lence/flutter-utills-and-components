// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';
import 'package:autovogue_main/utils/helpers/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../../screens/auth_screens/verify_account_screen.dart';

class HTTPServices {
  // static final baseUrl = dotenv.env['API_BASE_URL'];
  static final baseUrl = 'https://autovogue-backend-api.onrender.com/api/v1/';

  static Future<dynamic> request({
    required BuildContext context,
    required String endpoint,
    String method = 'GET', 
    Map<String, dynamic>? body,
    Map<String, String>? extraHeaders,
    bool withToken = false,
    // bool showToast = true,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final String loggedEmail = prefs.getString('loggedEmail') ?? '';
    debugPrint('logged email $loggedEmail');

    final uri = Uri.parse('$baseUrl$endpoint');

    final headers = {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $bearerToken',
      ...?extraHeaders,
    };

    if (withToken) {
      final prefs = await SharedPreferences.getInstance();
      final bearerToken = prefs.getString('token') ?? '';
      headers['Authorization'] = 'Bearer $bearerToken';
    }

    debugPrint('request body $body');

    http.Response response;

    try {
      if (method == 'POST') {
        response = await http.post(
          uri,
          headers: headers,
          body: jsonEncode(body),
        );
      } else if (method == 'PUT') {
        response = await http.put(
          uri,
          headers: headers,
          body: jsonEncode(body),
        );
      } else if (method == 'DELETE') {
        response = await http.delete(uri, headers: headers);
      } else if (method == 'PATCH') {
        response = await http.patch(
          uri,
          headers: headers,
          body: jsonEncode(body),
        );
      } else {
        response = await http.get(uri, headers: headers);
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        debugPrint(' success response ${response.body}');
        return jsonDecode(response.body);
      } else {
        final errorRes = jsonDecode(response.body);
        print(errorRes);
        if (errorRes['message'] is List) {
          debugPrint('error response ${errorRes['message'].join(', ')}');
          CustomToast.show(
            context,
            message: errorRes['message'].join('\n'),
            type: ToastType.error,
          );
          // showCustomToast(
          //   BannerToastWidget.fail(
          //     context: context,
          //     msg: errorRes['message'].join('\n'),
          //   ),
          //   context,
          // );
        } else {
          debugPrint('error responseee ${errorRes['message']}');

          CustomToast.show(
            context,
            message: errorRes['message'],
            type: ToastType.error,
          );
        }
        // Check if user is not activated and redirect to verification screen
        if (errorRes['statusCode'] == 403 &&
            errorRes['message'] == 'User account is not yet activated') {
          Get.to(VerifyAccountScreen(emailAddress: loggedEmail.toString()));
          await Future.delayed(
            const Duration(seconds: 5),
            (){
              CustomToast.show(
              context,
              message: '${errorRes['message']}, Enter verification code sent to your mail.',
              type: ToastType.success,
            );
            }
          );

          return null;
        }
      }
    } on SocketException {
      CustomToast.show(
        context,
        message: 'No internet connection',
        type: ToastType.error,
      );
      throw Exception('No Internet connection');
    } on FormatException {
      throw Exception('Invalid response format');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
