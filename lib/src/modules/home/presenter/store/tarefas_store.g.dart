// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarefas_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TarefasStore on TarefasStoreBase, Store {
  late final _$tarefasListAtom =
      Atom(name: 'TarefasStoreBase.tarefasList', context: context);

  @override
  ObservableList<TarefasModel> get tarefasList {
    _$tarefasListAtom.reportRead();
    return super.tarefasList;
  }

  @override
  set tarefasList(ObservableList<TarefasModel> value) {
    _$tarefasListAtom.reportWrite(value, super.tarefasList, () {
      super.tarefasList = value;
    });
  }

  late final _$TarefasStoreBaseActionController =
      ActionController(name: 'TarefasStoreBase', context: context);

  @override
  void addTarefa(TarefasModel tarefasModel) {
    final _$actionInfo = _$TarefasStoreBaseActionController.startAction(
        name: 'TarefasStoreBase.addTarefa');
    try {
      return super.addTarefa(tarefasModel);
    } finally {
      _$TarefasStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tarefasList: ${tarefasList}
    ''';
  }
}
