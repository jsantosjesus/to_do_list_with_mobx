import 'package:mobx/mobx.dart';
import 'package:to_do_list_with_mobx/src/modules/home/models/tarefas_model.dart';

part 'tarefas_store.g.dart';

class TarefasStore = TarefasStoreBase with _$TarefasStore;

abstract class TarefasStoreBase with Store {
  @observable
  ObservableList<TarefasModel> tarefasList = ObservableList<TarefasModel>();

  @action
  void addTarefa(TarefasModel tarefasModel) {
    tarefasList.add(tarefasModel);
  }

  @action
  void editTarefa({required TarefasModel tarefasModel, required int index}) {
    tarefasList.removeAt(index);

    tarefasList.insert(index, tarefasModel);
  }

  @action
  void removeTarefa(int index) {
    tarefasList.removeAt(index);
  }

  @action
  bool checkTarefa({required TarefasModel tarefasModel, required int index}) {
    tarefasList.removeAt(index);

    final tarefa = TarefasModel(
        title: tarefasModel.title,
        check: !tarefasModel.check,
        important: tarefasModel.important,
        urgent: tarefasModel.urgent);

    tarefasList.insert(index, tarefa);

    return tarefa.check;
  }
}
