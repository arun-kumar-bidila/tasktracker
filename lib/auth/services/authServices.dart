import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tasktracker/auth/screens/signin_screen.dart';
import 'package:tasktracker/common/response_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:tasktracker/common/response_handler.dart';
import 'package:tasktracker/constants/global_variables.dart';

class Authservices {
  Future<void> signupUser(
      {required BuildContext context,
      required String name,
      required String userName,
      required String password}) async {
    try {
      http.Response res = await http.post(Uri.parse("$uri/api/signup"),
          headers: {"Content-type": "application/json;charset=UTF-8"},
          body: jsonEncode(
              {"name": name, "userName": userName, "password": password}));

      ResponseHandler(
          context: context,
          response: res,
          onSuccess: () {
            ResponseDialog.showSuccessDialog(
                context: context,
                message: "Account Created Successfully",
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, SigninScreen.routeName, (route) => false);
                });
          });
    } catch (e) {
      ResponseDialog.showErrorDialog(context: context, message: e.toString());
    }
  }
}
