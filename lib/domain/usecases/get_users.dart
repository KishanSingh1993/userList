// domain/usecases/get_users.dart


import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetUsers {
  final UserRepository repository;

  GetUsers(this.repository);

  Future<List<User>> call(int page) async {
    return await repository.getUsers(page);
  }
}

