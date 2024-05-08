import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter_api/constants/constants.dart';
import 'package:flutter_api/models/user.dart';


class ApiService{
  Future<List<User>?> getUsers() async{
   try{
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
    var response = await http.get(url);
    print('na man you be');
    if(response.statusCode == 200){
      print(response.body);
      List<dynamic> jsonList = json.decode(response.body);
      List<User> users = jsonList.map((json) => User.fromJson(json)).toList();
      return users;
    }
    }catch(e){
    log(e.toString());
  }
}}