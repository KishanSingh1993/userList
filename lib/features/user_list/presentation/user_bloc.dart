import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../domain/fetch_users.dart';
import '../domain/user.dart';


part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final FetchUsers fetchUsers;

  UserBloc(this.fetchUsers) : super(UserInitial()) {
    on<FetchUserList>((event, emit) async {
      emit(UserLoading());
      final result = await fetchUsers.execute(PageParams(page: event.page));
      result.fold(
            (failure) => emit(UserError(failure.message)),
            (users) => emit(UserLoaded(users)),
      );
    });
  }
}
