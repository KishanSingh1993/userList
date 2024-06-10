part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class FetchUserList extends UserEvent {
  final int page;

  FetchUserList(this.page);

  @override
  List<Object> get props => [page];
}
