import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'features/user_list/data/user_repository.dart';
import 'features/user_list/domain/fetch_users.dart';
import 'features/user_list/presentation/user_bloc.dart';
import 'features/user_list/presentation/widgets/user_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Listing App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SFPro',
      ),
      home: BlocProvider(
        create: (context) => UserBloc(
          FetchUsers(
            UserRepository(http.Client()),
          ),
        )..add(FetchUserList(1)),
        child: UserListPage(),
      ),
    );
  }
}