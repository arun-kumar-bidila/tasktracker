import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tasktracker/common/response_dialog.dart';

void ResponseHandler(
    {required BuildContext context,
    
    required http.Response response,
    required VoidCallback onSuccess,}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      ResponseDialog.showErrorDialog(
          context: context, message: jsonDecode(response.body)["msg"]);
      break;
    case 500:
      ResponseDialog.showErrorDialog(
          context: context, message: jsonDecode(response.body)["error"]);
      break;
    default:
      ResponseDialog.showErrorDialog(context: context, message: response.body);
  }
}
