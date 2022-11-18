import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../entities/to_do_entity.dart';

abstract class ToDoRepository {
  Future<Either<Failure, List<ToDoEntity>>> getToDos();
  Future<Either<Failure, ToDoEntity>> getToDo(String id);
  Future<Either<Failure, List<ToDoEntity>>> getToDosUserId(String userId);
}
