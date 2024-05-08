import 'package:flutter/material.dart';

import 'package:flutter_api/constants/constants.dart';
import 'package:flutter_api/shared/api_service.dart';
import 'package:flutter_api/models/user.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  late List<User> ? _user = [];


  @override
 void initState() {
   super.initState();
   _getData;
 }

  void _getData() async{
    _user = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
      
    }));
  }

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(
        title: const Text('API CALLS USING MODEL'),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
    );
  }
}