import 'package:flutter/material.dart';
import 'package:flutter_user_listing/features/user_list/presentation/widgets/user_detail_page.dart';

import '../../domain/user.dart';



class UserListTile extends StatelessWidget {
  final User user;

  const UserListTile({required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: user.id,
        child: CircleAvatar(
          backgroundImage: NetworkImage(user.avatar),
        ),
      ),
      title: Text('${user.firstName} ${user.lastName}'),
      subtitle: Text(user.email),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserDetailsPage(user: user),
          ),
        );
      },
    );
  }
}