import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/data/model/to_do_model.dart';
import '../config/contants/constants.dart';

part 'rest_client.g.dart';

@lazySingleton
@RestApi()
abstract class RestClient {
  @factoryMethod
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(AppContants.todos)
  Future<List<ToDoModel>> getToDos();

  @GET('${AppContants.todos}/{id}')
  Future<ToDoModel> getToDo(@Path('id') String id);

  @GET(AppContants.todos)
  Future<List<ToDoModel>> getToDosUserId(@Query('userId') String userId);
}
