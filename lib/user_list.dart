// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http_request/model/user.dart';
import 'package:flutter_http_request/service/auth_service/user_service/user_service.dart';

class UserListView extends StatefulWidget {
  const UserListView({Key? key}) : super(key: key);

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  //STATE
  List users = [];
  getUsers() async {
    users = await UserService().getUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UserListView"),
        actions: [
          IconButton(
            onPressed: () => getUsers(),
            icon: const Icon(
              Icons.refresh,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.length,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          Map<String, dynamic> item = users[index];

          User user = User.fromJson(item);

          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[200],
                backgroundImage: NetworkImage(
                  user.avatar.toString(),
                ),
              ),
              title: Text(user.firstName ?? "-"),
              subtitle: Text(user.id.toString()),
            ),
          );
        },
      ),
    );
  }
}
