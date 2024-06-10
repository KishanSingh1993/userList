// domain/usecases/get_user.dart


import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetUser {
  final UserRepository repository;

  GetUser(this.repository);

  Future<User> call(int userId) async {
    return await repository.getUser(userId);
  }
}
