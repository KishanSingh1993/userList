import 'package:flutter/material.dart';

import '../../data/api_provider.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/get_user.dart';

class UserDetailScreen extends StatelessWidget {
  final int userId;

  UserDetailScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Detail')),
      body: FutureBuilder<User>(
        future: GetUser(UserRepositoryImpl(ApiProvider()))(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final user = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user.avatar),
                  ),
                  const SizedBox(height: 20),
                  Text('${user.firstName} ${user.lastName}', style: TextStyle(fontSize: 24)),
                  const SizedBox(height: 10),
                  Text(user.email, style: const TextStyle(fontSize: 18)),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}