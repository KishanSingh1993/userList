import 'package:flutter/material.dart';
import 'package:flutter_user_listing/features/user_list/presentation/widgets/user_detail_page.dart';

import '../../domain/user.dart';



class UserListTile extends StatelessWidget {
  final User user;

  const UserListTile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(user.avatar)),
      title: Text('${user.firstName} ${user.lastName}', style: const TextStyle(fontFamily: 'SFPro')),
      subtitle: Text(user.email, style: const TextStyle(fontFamily: 'SFPro')),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserDetailPage(userId: user.id),
        ),
      ),
    );
  }
}
