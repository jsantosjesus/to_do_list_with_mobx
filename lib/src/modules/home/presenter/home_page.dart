import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_list_with_mobx/src/modules/home/models/tarefas_model.dart';
import 'package:to_do_list_with_mobx/src/modules/home/presenter/components/add_tarefa_dialog.dart';
import 'package:to_do_list_with_mobx/src/modules/home/presenter/store/tarefas_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  _dialog({context, TarefasModel? tarefasModel, int? index}) {
    showDialog(
        context: context,
        builder: (_) {
          return AddTarefaDialog(
            tarefasModel: tarefasModel,
            index: index,
          );
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
                  widget._dialog(context: context);
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
                    leading: CircleAvatar(
                      backgroundColor: Colors.black54,
                      child: Icon(
                        tarefa.check
                            ? Icons.check
                            : tarefa.urgent
                                ? Icons.warning
                                : tarefa.important
                                    ? Icons.alarm
                                    : Icons.task,
                        color: tarefa.urgent & tarefa.important
                            ? Colors.red
                            : Colors.amber,
                      ),
                    ),
                    title: Text(tarefa.title),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                            value: tarefa.check,
                            onChanged: (value) {
                              store.checkTarefa(
                                  tarefasModel: tarefa, index: index);
                            }),
                        IconButton(
                            onPressed: () {
                              widget._dialog(
                                  context: context,
                                  tarefasModel: TarefasModel(
                                      title: tarefa.title,
                                      check: false,
                                      important: tarefa.important,
                                      urgent: tarefa.urgent),
                                  index: index);
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              store.removeTarefa(index);
                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    ));
              }),
        ));
  }
}
