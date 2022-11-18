import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/usecases/usecase.dart';
import '../../domain/entities/to_do_entity.dart';
import '../../domain/usecases/get_to_do.dart';
import '../../domain/usecases/get_to_dos.dart';
import '../../domain/usecases/get_to_dos_user_id.dart';
import 'to_do_state.dart';

@injectable
class ToDoCubit extends Cubit<ToDoState> {
  final GetToDosUseCase getToDosUseCase;
  final GetToDoUseCase getToDoUseCase;
  final GetToDosUserIdUseCase getToDosUserIdUseCase;

  ToDoCubit({
    required this.getToDosUseCase,
    required this.getToDoUseCase,
    required this.getToDosUserIdUseCase,
  }) : super(ToDoState());

  Future<void> getToDos() async {
    final result = await getToDosUseCase.call(NoParams());
    final either = result.fold((l) => l, (r) => r);
    if (either is List<ToDoEntity>) {
      print(either);
    } else {
      print(either);
    }
  }

  Future<void> getToDo() async {
    final result = await getToDoUseCase.call(GetToDoParams(id: '1'));
    final either = result.fold((l) => l, (r) => r);
    if (either is ToDoEntity) {
      print(either);
    }
  }

  Future<void> getToDosUserId() async {
    final result =
        await getToDosUserIdUseCase.call(GetToDosUserIdParams(userId: '2'));
    final either = result.fold((l) => l, (r) => r);
    if (either is List<ToDoEntity>) {
      print(either);
    }
  }
}
