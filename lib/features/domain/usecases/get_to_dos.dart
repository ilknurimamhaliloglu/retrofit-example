import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/to_do_entity.dart';
import '../repositories/to_do_repository.dart';

@injectable
class GetToDosUseCase extends UseCase<List<ToDoEntity>, NoParams> {
  final ToDoRepository toDoRepository;

  GetToDosUseCase({required this.toDoRepository});

  @override
  Future<Either<Failure, List<ToDoEntity>>> call(NoParams params) async {
    final result = await toDoRepository.getToDos();
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
