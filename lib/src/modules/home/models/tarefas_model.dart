import 'package:mobx/mobx.dart';

part 'tarefas_model.g.dart';

class TarefasModel = TarefasModelBase with _$TarefasModel;

abstract class TarefasModelBase with Store {
  TarefasModelBase(
      {required this.title, this.check, this.important, this.urgent});

  @observable
  String title;

  @observable
  bool? check;

  @observable
  bool? important;

  @observable
  bool? urgent;
}
