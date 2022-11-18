import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/services/rest_client.dart';
import '../model/to_do_model.dart';

abstract class ToDoDatasource {
  Future<List<ToDoModel>> getToDos();
  Future<ToDoModel> getToDo(String id);
  Future<List<ToDoModel>> getToDosUserId(String userId);
}

@Injectable(as: ToDoDatasource)
class ToDoDatasourceImpl implements ToDoDatasource {
  final RestClient restClient;

  ToDoDatasourceImpl(this.restClient);

  @override
  Future<List<ToDoModel>> getToDos() async {
    try {
      final result = await restClient.getToDos();
      return result;
    } on DioError catch (e) {
      throw ServerException.returnDioResponse(e);
    } catch (e) {
      throw ServerException('Something went wrong');
    }
  }

  @override
  Future<ToDoModel> getToDo(String id) async {
    try {
      final result = await restClient.getToDo(id);
      return result;
    } on DioError catch (e) {
      throw ServerException.returnDioResponse(e);
    } catch (e) {
      throw ServerException('Something went wrong');
    }
  }

  @override
  Future<List<ToDoModel>> getToDosUserId(String userId) async {
    try {
      final result = await restClient.getToDosUserId(userId);
      return result;
    } on DioError catch (e) {
      throw ServerException.returnDioResponse(e);
    } catch (e) {
      throw ServerException('Something went wrong');
    }
  }
}
