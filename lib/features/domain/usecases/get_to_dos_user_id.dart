import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/to_do_entity.dart';
import '../repositories/to_do_repository.dart';

@injectable
class GetToDosUserIdUseCase
    extends UseCase<List<ToDoEntity>, GetToDosUserIdParams> {
  final ToDoRepository toDoRepository;

  GetToDosUserIdUseCase({required this.toDoRepository});

  @override
  Future<Either<Failure, List<ToDoEntity>>> call(
      GetToDosUserIdParams params) async {
    final result = await toDoRepository.getToDosUserId(params.userId);
    final either = result.fold((l) => l, (r) => r);
    if (either is List<ToDoEntity>) {
      return Right(either);
    } else if (either is SocketException) {
      // Do something when catched socket exception
    } else if (either is ServerFailure) {
      return Left(ServerFailure(either.message));
    }
    return Left(ServerFailure(either.toString()));
  }
}

class GetToDosUserIdParams {
  final String userId;

  GetToDosUserIdParams({
    required this.userId,
  });
}
