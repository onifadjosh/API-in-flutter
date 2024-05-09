import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_api/models/user.dart';
import 'package:flutter_api/constants/constants.dart';

class ApiService {
  // static const String baseUrl = ApiConstants.baseUrl;

  static Future<List<UserModel>> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body)['results'];
        return jsonList.map((json) => UserModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Failed to fetch data: $error');
    }
  }
}
