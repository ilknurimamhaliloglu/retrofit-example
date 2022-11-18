import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/to_do_entity.dart';
import '../repositories/to_do_repository.dart';

@injectable
class GetToDoUseCase extends UseCase<ToDoEntity, GetToDoParams> {
  final ToDoRepository toDoRepository;

  GetToDoUseCase({required this.toDoRepository});

  @override
  Future<Either<Failure, ToDoEntity>> call(GetToDoParams params) async {
    final result = await toDoRepository.getToDo(params.id);
    final either = result.fold((l) => l, (r) => r);
    if (either is ToDoEntity) {
      return Right(either);
    } else if (either is SocketException) {
      // Do something when catched socket exception
    } else if (either is ServerFailure) {
      return Left(ServerFailure(either.message));
    }
    return Left(ServerFailure(either.toString()));
  }
}

class GetToDoParams {
  final String id;

  GetToDoParams({
    required this.id,
  });
}
