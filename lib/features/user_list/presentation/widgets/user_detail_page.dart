import 'package:flutter/material.dart';
import '../../domain/user.dart';

class UserDetailsPage extends StatelessWidget {
  final User user;

  const UserDetailsPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.firstName} ${user.lastName}', style: TextStyle(fontFamily: 'SFPro')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: user.id,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.avatar),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '${user.firstName} ${user.lastName}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'SFPro'),
            ),
            const SizedBox(height: 10),
            Text(
              user.email,
              style: TextStyle(fontSize: 18, color: Colors.grey, fontFamily: 'SFPro'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Additional user information goes here.',
              style: TextStyle(fontSize: 16, fontFamily: 'SFPro'),
            ),
          ],
        ),
      ),
    );
  }
}
