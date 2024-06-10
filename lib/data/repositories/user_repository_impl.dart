// data/repositories/user_repository_impl.dart


import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../api_provider.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiProvider apiProvider;

  UserRepositoryImpl(this.apiProvider);

  @override
  Future<List<User>> getUsers(int page) async {
    final List<UserModel> userModels = await apiProvider.fetchUsers(page);
    // Convert UserModel to User
    return userModels.map((userModel) => User(
      id: userModel.id,
      email: userModel.email,
      firstName: userModel.firstName,
      lastName: userModel.lastName,
      avatar: userModel.avatar,
    )).toList();
  }

  @override
  Future<User> getUser(int userId) async {
    final UserModel userModel = await apiProvider.fetchUser(userId);
    // Convert UserModel to User
    return User(
      id: userModel.id,
      email: userModel.email,
      firstName: userModel.firstName,
      lastName: userModel.lastName,
      avatar: userModel.avatar,
    );
  }
}
