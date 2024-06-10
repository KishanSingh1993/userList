import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_user_listing/features/user_list/presentation/widgets/user_list_tile.dart';

import '../../data/user_repository.dart';
import '../../domain/fetch_users.dart';
import '../user_bloc.dart';
import 'package:http/http.dart' as http;


class UserListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List', style: TextStyle(fontFamily: 'SFPro')),
      ),
      body: BlocProvider(
        create: (context) => UserBloc(
          FetchUsers(
            UserRepository(http.Client()),
          ),
        )..add(FetchUserList(1)),
        child: UserListView(),
      ),
    );
  }
}

class UserListView extends StatefulWidget {
  @override
  _UserListViewState createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          context.read<UserBloc>().add(FetchUserList(++_currentPage));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserLoaded) {
          return ListView.builder(
            controller: _scrollController,
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              return UserListTile(user: state.users[index]);
            },
          );
        } else if (state is UserError) {
          return const Center(child: Text('Failed to fetch users'));
        } else {
          return Container();
        }
      },
    );
  }
}