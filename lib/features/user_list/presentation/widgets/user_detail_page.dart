import 'package:flutter/material.dart';

class UserDetailPage extends StatelessWidget {
  final int userId;

  const UserDetailPage({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fetch and display user details using animation
    // ...
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details', style: TextStyle(fontFamily: 'SFPro')),
      ),
      body: Center(
        child: Text('User Details for $userId', style: const TextStyle(fontFamily: 'SFPro')),
      ),
    );
  }
}
