import 'package:flutter/material.dart';
import 'package:to_do_list_with_mobx/src/modules/home/models/tarefas_model.dart';
import 'package:to_do_list_with_mobx/src/modules/home/presenter/store/tarefas_store.dart';
import 'package:get_it/get_it.dart';

class AddTarefaDialog extends StatefulWidget {
  final TarefasModel? tarefasModel;
  final int? index;

  const AddTarefaDialog({super.key, this.tarefasModel, this.index});

  @override
  State<AddTarefaDialog> createState() => _AddTarefaDialogState();
}

class _AddTarefaDialogState extends State<AddTarefaDialog> {
  // final TarefasStore store = TarefasStore();

  final TarefasStore store = GetIt.I<TarefasStore>();

  late String titleController;
  late bool importantController;
  late bool urgentController;

  @override
  void initState() {
    super.initState();

    if (widget.tarefasModel != null) {
      titleController = widget.tarefasModel!.title;
      importantController = widget.tarefasModel!.important;
      urgentController = widget.tarefasModel!.urgent;
    } else {
      titleController = '';
      importantController = false;
      urgentController = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicionar Tarefa'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: TextEditingController(text: titleController),
            onChanged: (value) {
              // setState(() {
              titleController = value;
              // });
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
                  if (titleController.isEmpty) {
                  } else if (widget.tarefasModel == null) {
                    store.addTarefa(TarefasModel(
                        title: titleController,
                        check: false,
                        important: importantController,
                        urgent: urgentController));
                  } else {
                    store.editTarefa(
                        tarefasModel: TarefasModel(
                            title: titleController,
                            check: false,
                            important: importantController,
                            urgent: urgentController),
                        index: widget.index!);
                  }
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
