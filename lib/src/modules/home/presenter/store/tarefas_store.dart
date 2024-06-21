import 'package:mobx/mobx.dart';
import 'package:to_do_list_with_mobx/src/modules/home/models/tarefas_model.dart';

part 'tarefas_store.g.dart';

class TarefasStore = TarefasStoreBase with _$TarefasStore;

abstract class TarefasStoreBase with Store {
  @observable
  ObservableList<TarefasModel> tarefasList =
      [TarefasModel(title: '')].asObservable();

  @action
  void addTarefa(TarefasModel tarefasModel) {
    tarefasList.add(tarefasModel);
  }
}
