import 'package:flutter/material.dart';
import 'package:to_do_list_with_mobx/src/modules/home/models/tarefas_model.dart';
import 'package:to_do_list_with_mobx/src/modules/home/presenter/store/tarefas_store.dart';
import 'package:get_it/get_it.dart';

class AddTarefaDialog extends StatefulWidget {
  const AddTarefaDialog({super.key});

  @override
  State<AddTarefaDialog> createState() => _AddTarefaDialogState();
}

class _AddTarefaDialogState extends State<AddTarefaDialog> {
  // final TarefasStore store = TarefasStore();

  final TarefasStore store = GetIt.I<TarefasStore>();

  String titleController = '';
  bool importantController = false;
  bool urgentController = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicionar Tarefa'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (value) {
              titleController = value;
            },
            decoration: const InputDecoration(labelText: 'título'),
          ),
          Row(
            children: [
              Checkbox(
                  value: importantController,
                  onChanged: (value) {
                    setState(() {
                      importantController = value!;
                    });
                  }),
              const Text('Essa tarefa é importante?'),
            ],
          ),
          Row(
            children: [
              Checkbox(
                  value: urgentController,
                  onChanged: (value) {
                    setState(() {
                      urgentController = value!;
                    });
                  }),
              const Text('Essa tarefa é urgente?'),
            ],
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  store.addTarefa(TarefasModel(
                      title: titleController,
                      important: importantController,
                      urgent: urgentController));
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.check)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.cancel_outlined)),
          ],
        )
      ],
    );
  }
}
