// presentation/blocs/user_event.dart
import 'package:equatable/equatable.dart';



abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class FetchUsers extends UserEvent {
  final int page;

  FetchUsers({required this.page});

  @override
  List<Object> get props => [page];
}
