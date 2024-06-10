// presentation/blocs/user_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_user_listing/presentation/blocs/user_event.dart';
import 'package:flutter_user_listing/presentation/blocs/user_state.dart';

import '../../domain/usecases/get_users.dart';


class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsers getUsers;

  UserBloc({required this.getUsers}) : super(UserInitial()) {
    on<FetchUsers>(_onFetchUsers);
  }

  Future<void> _onFetchUsers(FetchUsers event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final users = await getUsers(event.page);
      emit(UserLoaded(users: users));
    } catch (e) {
      emit(UserError(message: e.toString()));
    }
  }
}




