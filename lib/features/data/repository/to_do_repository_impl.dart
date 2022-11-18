import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../domain/entities/to_do_entity.dart';
import '../../domain/repositories/to_do_repository.dart';
import '../datasource/to_do_datasource.dart';
import '../model/to_do_model.dart';

typedef _GetToDos = Future<List<ToDoEntity>> Function();
typedef _GetToDo = Future<ToDoEntity> Function();

@Injectable(as: ToDoRepository)
class ToDoRepositoryImpl extends ToDoRepository {
  final ToDoDatasource _toDoDatasource;

  ToDoRepositoryImpl(this._toDoDatasource);

  @override
  Future<Either<Failure, List<ToDoEntity>>> getToDos() async {
    return _getToDos(() async {
      final todos = await _toDoDatasource.getToDos();
      final result = todos.map((e) => _modelToEntity(e)).toList();
      return result;
    });
  }

  @override
  Future<Either<Failure, ToDoEntity>> getToDo(String id) async {
    return _getToDo(() async {
      final todo = await _toDoDatasource.getToDo(id);
      final result = _modelToEntity(todo);
      return result;
    });
  }

  @override
  Future<Either<Failure, List<ToDoEntity>>> getToDosUserId(
      String userId) async {
    return _getToDos(() async {
      final todos = await _toDoDatasource.getToDosUserId(userId);
      final result = todos.map((e) => _modelToEntity(e)).toList();
      return result;
    });
  }
}

Future<Either<Failure, List<ToDoEntity>>> _getToDos(
  _GetToDos getToDos,
) async {
  try {
    final result = await getToDos();
    return Right(result);
  } on SocketException catch (e) {
    // Do something when catched socket exception
    return Left(ServerFailure(e.message.toString()));
  } on ServerException catch (e) {
    return Left(ServerFailure(e.message.toString()));
  }
}

Future<Either<Failure, ToDoEntity>> _getToDo(
  _GetToDo getToDo,
) async {
  try {
    final result = await getToDo();
    return Right(result);
  } on SocketException catch (e) {
    // Do something when catched socket exception
    return Left(ServerFailure(e.message.toString()));
  } on ServerException catch (e) {
    return Left(ServerFailure(e.message.toString()));
  }
}

ToDoEntity _modelToEntity(ToDoModel model) {
  return ToDoEntity(
    userId: model.userId,
    id: model.id,
    title: model.title,
    completed: model.completed,
  );
}
