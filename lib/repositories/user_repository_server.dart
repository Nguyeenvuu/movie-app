import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie_app/utils/base_url.dart';

class UserRepositoryServer {
  static String urlLogin = baseUrlServer + customerUrlLogin;
  static String urlRegister = baseUrlServer + customerUrlRegister;

  //============================== Login User ========================================
  static Future<Map<String, dynamic>> login(
      {String userName, String password}) async {
    http.Response response = await http.post(urlLogin,
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(
            <String, String>{'user_name': userName, 'password': password}));

    Map<String, dynamic> resData = json.decode(response.body);
    print(resData['Sign In Success']);
    return resData;
  }

//======================================= Register User ================================
  static Future<Map<String, dynamic>> register(
      {String userName,
      String password,
      String name,
      String email,
      String address,
      String birthday,
      String gender}) async {
    print(urlRegister);
    http.Response response = await http.post(urlRegister,
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          'user_name': userName,
          'password': password,
          'name': name,
          'email': email,
          'adress': address,
          'birthday': birthday,
          'gender': gender,
        }));

    Map<String, dynamic> resData = json.decode(response.body);
    return resData;
  }
  // Đăng ký user mới
  //   Map<String, dynamic> user1 = await UserRepository.register(
  //     userName: 'user_003',
  //     password: 'user_002',
  //     address: 'adasdas',
  //     birthday: '24-10-1998',
  //     email: "abc3@gmail.com",
  //     gender: "Female",
  //     name: "Nguyeen");
  // print('${user1.keys}: ${user1.values}');

//===============================================================
  @override
  String toString() {
    return "urlLogin: $urlLogin, urlRegister: $urlRegister";
  }
}
