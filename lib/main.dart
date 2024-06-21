import 'package:flutter/material.dart';
import 'package:to_do_list_with_mobx/src/modules/home/presenter/store/tarefas_store.dart';
import 'package:to_do_list_with_mobx/src/my_app.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
void main() {
  getIt.registerSingleton<TarefasStore>(TarefasStore());
  runApp(const MyApp());
}
