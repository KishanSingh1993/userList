import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_user_listing/presentation/screens/user_list_screen.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(UserListingApp());
}

class UserListingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Listing App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SFPro',
      ),
      home: UserListScreen(),
    );
  }
}

















// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'User Listing App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         fontFamily: 'SFPro',
//       ),
//       home: BlocProvider(
//         create: (context) => UserBloc(
//           FetchUsers(
//             UserRepository(http.Client()),
//           ),
//         )..add(FetchUserList(1)),
//         child: UserListPage(),
//       ),
//     );
//   }
// }