import 'package:flutter/material.dart';

import 'core/config/dependency/injectable.dart';
import 'features/presentation/to_do_view.dart';

void main() {
  configureDependencies();
  runApp(const ToDoView());
}
