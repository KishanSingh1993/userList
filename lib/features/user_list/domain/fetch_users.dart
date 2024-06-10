import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import 'user.dart';
import '../data/user_repository.dart';

class FetchUsers {
  final UserRepository repository;

  FetchUsers(this.repository);

  Future<Either<Failure, List<User>>> execute(PageParams params) async {
    try {
      final users = await repository.fetchUsers(params.page);
      return Right(users);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}

class PageParams extends Equatable {
  final int page;

  PageParams({required this.page});

  @override
  List<Object> get props => [page];
}
