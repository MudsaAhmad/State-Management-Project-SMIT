import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  bool loading = false;

  bool get getLoading => loading;

  set setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<void> loginAPIFunction(
      BuildContext context, String email, String password) async {
    try {
      setLoading = true;

      final url = Uri.parse(
          '');

      print('url-------->$url');

      String token =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YWM2Yzg0MmNlMzBhNThjM2I2MjRhNyIsImlhdCI6MTczOTQ1NjE5Nn0.IrnRDgCDUjzyL1uqnDgLDfr5AyQ8vC8IaKGNaVX089I';

      final headers = {
        "Content-Type": "application/json",
        // "Authorization" : "Bearer $token",
      };

      print('headers------->$headers');

      final requestBody = {
        "email": email,
        "password": password,
      };
      print('body------->${requestBody.toString()}');

      final response =
          await http.post(url, headers: headers, body: jsonEncode(requestBody));

      print('response---->${response.body.toString()}');

      if (response.statusCode == 200) {
        final getResponse = jsonDecode(response.body);

        String message = getResponse['msg'];
        print('message---------->$message');

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$message')));

        print('get response ---->${getResponse.toString()}');
        setLoading = false;
      } else {
        print('error-------->');


        // if(response['msg'])
        //
        // String message = response['msg'];
        // print('message---------->$message');
        //
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text('$message')));

        setLoading = false;
      }
    } catch (e) {
      print('error------->$e');
      setLoading = false;
    }
  }
}
