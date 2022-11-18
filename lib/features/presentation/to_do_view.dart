import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/config/dependency/injectable.dart';
import 'cubit/to_do_cubit.dart';
import 'cubit/to_do_state.dart';

class ToDoView extends StatelessWidget {
  const ToDoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ToDoCubit>(),
      child: BlocBuilder<ToDoCubit, ToDoState>(
        builder: (context, state) {
          final cubit = context.read<ToDoCubit>();
          return MaterialApp(
            title: 'Material App',
            home: Scaffold(
              appBar: AppBar(
                title: const Text('Material App Bar'),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: cubit.getToDos,
                      child: const Text('Get To Dos'),
                    ),
                    ElevatedButton(
                      onPressed: cubit.getToDo,
                      child: const Text('Get To Do'),
                    ),
                    ElevatedButton(
                      onPressed: cubit.getToDosUserId,
                      child: const Text('Get To Dos User Id'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
