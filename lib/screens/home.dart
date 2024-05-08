

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class Home extends StatefulWidget {
  // final int length;

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  
  Future<Map<String, dynamic>> getTeams() async{
    //ignore: prefer_const_declarations
    
    //ignore: prefer_const_declarations
    // final String apiUrl = 'https://api.balldontlie.io/v1/teams';
    
  
    print('na man you be');
    final response = await http.get(
      Uri.parse('https://randomuser.me/api/?results=100'),
      // headers: {
      //   'Authorization': 'Bearer $authToken',
      //   'Content-Type': 'application/json',
      // },
      
    );

    // print(response.statusCode);

    if (response.statusCode==200){
      // print('LFG');
      // print (response.body);
      return jsonDecode(response.body);
      // print (jsonDecode(response.body));

    }else{
      // print('nooooo');
      // print('Failed to load teams: ${response.statusCode}');
      throw Exception('Failed to load teams');
    }

    
  
  }

  // List<dynamic> users = [];

  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: _appBar(),
      body: FutureBuilder(
        future: getTeams(),
        builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        
          if (snapshot.connectionState == ConnectionState.waiting) {
          // If the future is still in progress, display a loading indicator
          return const Center(child: CircularProgressIndicator());
          }else if (snapshot.hasError) {
          // If an error occurs, display the error message
          return Center(child: Text('Error: ${snapshot.error}'));
          } else {
          // If the future completes successfully, print the data
          // print(snapshot.data);
          // Here, you can return a widget to display the fetched data
            final List<dynamic> users = snapshot.data!['results'];
          // final email = users['email'];
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Container(
                margin: EdgeInsets.only(bottom: 10, right: 10, left: 10, top: 10),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [BoxShadow(
                     color: Colors.grey,
                     offset: Offset(2, 2), 
                  )]

                ),
                child: ListTile(
                  title: Text('${user['name']['first']} ${user['name']['last']}'),
                  subtitle: Text('${user['location']['city']}, ${user['email']}'),
                  leading: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network('${user['picture']['thumbnail']}'),
                    ),
                  ),
                ),
    
              );
              
            },
          ); // Placeholder widget
        }}
    ));
  }

  AppBar _appBar() {
    return AppBar(
      
      backgroundColor: Colors.blue,
      title:const Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          
          Column(
            
            children: [
              Icon(Icons.menu, color: Colors.white, size:36, ),
            ],
          ),
          Expanded(
            child: Column(
            children: [
              Text("REST API CALL", style: TextStyle(color: Colors.white, fontSize: 24), textAlign: TextAlign.center,),
            ]
          )
            )
        ],
      ),
    );
  }
}

