import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_list_with_mobx/src/modules/home/presenter/components/add_tarefa_dialog.dart';
import 'package:to_do_list_with_mobx/src/modules/home/presenter/store/tarefas_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  _dialog(context) {
    showDialog(
        context: context,
        builder: (_) {
          return const AddTarefaDialog();
        });
  }
}

class _HomePageState extends State<HomePage> {
  final TarefasStore store = GetIt.I<TarefasStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de tarefas'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  widget._dialog(context);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: Observer(
          builder: (_) => ListView.builder(
              itemCount: store.tarefasList.length,
              itemBuilder: (_, index) {
                final tarefa = store.tarefasList[index];
                return ListTile(
                  title: Text(tarefa.title),
                );
              }),
        ));
  }
}
