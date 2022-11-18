// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../features/data/datasource/to_do_datasource.dart' as _i6;
import '../../../features/data/repository/to_do_repository_impl.dart' as _i8;
import '../../../features/domain/repositories/to_do_repository.dart' as _i7;
import '../../../features/domain/usecases/get_to_do.dart' as _i9;
import '../../../features/domain/usecases/get_to_dos.dart' as _i10;
import '../../../features/domain/usecases/get_to_dos_user_id.dart' as _i11;
import '../../../features/presentation/cubit/to_do_cubit.dart' as _i12;
import '../../services/rest_client.dart' as _i5;
import 'interceptors.dart' as _i3;
import 'network_module.dart' as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  gh.lazySingleton<_i3.DioInterceptors>(() => _i3.DioInterceptors());
  gh.lazySingleton<_i4.Dio>(
      () => networkModule.dio(get<_i3.DioInterceptors>()));
  gh.lazySingleton<_i5.RestClient>(() => _i5.RestClient(get<_i4.Dio>()));
  gh.factory<_i6.ToDoDatasource>(
      () => _i6.ToDoDatasourceImpl(get<_i5.RestClient>()));
  gh.factory<_i7.ToDoRepository>(
      () => _i8.ToDoRepositoryImpl(get<_i6.ToDoDatasource>()));
  gh.factory<_i9.GetToDoUseCase>(
      () => _i9.GetToDoUseCase(toDoRepository: get<_i7.ToDoRepository>()));
  gh.factory<_i10.GetToDosUseCase>(
      () => _i10.GetToDosUseCase(toDoRepository: get<_i7.ToDoRepository>()));
  gh.factory<_i11.GetToDosUserIdUseCase>(() =>
      _i11.GetToDosUserIdUseCase(toDoRepository: get<_i7.ToDoRepository>()));
  gh.factory<_i12.ToDoCubit>(() => _i12.ToDoCubit(
        getToDosUseCase: get<_i10.GetToDosUseCase>(),
        getToDoUseCase: get<_i9.GetToDoUseCase>(),
        getToDosUserIdUseCase: get<_i11.GetToDosUserIdUseCase>(),
      ));
  return get;
}

class _$NetworkModule extends _i13.NetworkModule {}
