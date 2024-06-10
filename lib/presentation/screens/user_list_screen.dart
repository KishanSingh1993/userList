import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_user_listing/presentation/blocs/user_bloc.dart';
import 'package:flutter_user_listing/presentation/screens/user_detail_screen.dart';

import '../../data/api_provider.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/usecases/get_users.dart';
import '../blocs/user_event.dart';
import '../blocs/user_state.dart';

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User List')),
      body: BlocProvider(
        create: (context) => UserBloc(getUsers: GetUsers(UserRepositoryImpl(ApiProvider()))),
        child: UserList(),
      ),
    );
  }
}

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  bool _isFetching = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _fetchUsers();
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_isFetching) {
      _fetchUsers();
    }
  }

  void _fetchUsers() {
    _isFetching = true;
    context.read<UserBloc>().add(FetchUsers(page: _currentPage));
    _currentPage++;
    _isFetching = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserLoaded) {
          return ListView.builder(
            controller: _scrollController,
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              final user = state.users[index];
              return ListTile(
                leading: Image.network(user.avatar),
                title: Text('${user.firstName} ${user.lastName}'),
                subtitle: Text(user.email),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetailScreen(userId: user.id),
                    ),
                  );
                },
              );
            },
          );
        } else if (state is UserError) {
          return Center(child: Text(state.message));
        }
        return Container();
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}