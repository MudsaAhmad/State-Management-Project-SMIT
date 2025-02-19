//
// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart';
//
// class LoginProvider extends ChangeNotifier{
//
//   bool _isLoading = false;
//   bool get isLoading => _isLoading;
//
//   set setLoading(bool value) {
//     _isLoading = value;
//     notifyListeners();
//   }
//
//   List<int> numberList = [1,2,3,4];
//
//   void addNumber(){
//     int num = numberList.last;
//     numberList.add(num+1);
//     notifyListeners();
//   }
//
//   Future<void> loginAPIFunction ({
//     required String email,
//     required String password,
//   }) async {
//     try{
//
//       setLoading = true;
//
//       final url = Uri.parse('https://pantry-persona-dev-h8gqe6c0f9hwdvff.canadacentral-01.azurewebsites.net/api/user/login');
//       print('url ------$url');
//       final body = {
//         'email': email,
//         'password': password,
//       };
//       print('body ----- $body');
//       final headers = {
//         'Content-Type': 'application/json',
//       };
//       print('body ----- $headers');
//
//       Response response = await http.post(url, headers: headers,body: json.encode(body),);
//       print('response --------- ${response.body.toString()}');
//
//       // navigation
//
//       if(response.statusCode == 200)
//       {
//         print('yes status code 200 -----${response.body.toString()}');
//         setLoading = false;
//       }else{
//         print('Not status code 200 -----');setLoading = false;
//       }
//     }catch(e){
//       print('error ----------$e');setLoading = false;
//     }
//   }
//
//
// }