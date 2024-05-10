import 'package:flutter/material.dart';
import 'package:flutter_api/models/user.dart';
import 'package:flutter_api/shared/api_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<UserModel>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _usersFuture = ApiService.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API CALLS USING MODEL'),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: FutureBuilder<List<UserModel>>(
        future: _usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.lightBlue,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var user = snapshot.data![index];
                return ListTile(
                  leading: CircleAvatar(
                    // Display initial of first name as avatar
                    child: Text(user.firstName[0]),
                  ),
                  // title: Text('${user.title} ${user.firstName} ${user.lastName}'),
                  title: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: '${user.title}'),
                        TextSpan(text: '${user.firstName} ${user.lastName}')

                      ])
                  ),
                  subtitle: Text(user.city),
                  // You can display more user information here as needed
                );
              },
            );
          } else {
            return Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }
}
