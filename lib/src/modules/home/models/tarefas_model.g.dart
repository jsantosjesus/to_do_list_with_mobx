// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarefas_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TarefasModel on TarefasModelBase, Store {
  late final _$titleAtom =
      Atom(name: 'TarefasModelBase.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$checkAtom =
      Atom(name: 'TarefasModelBase.check', context: context);

  @override
  bool? get check {
    _$checkAtom.reportRead();
    return super.check;
  }

  @override
  set check(bool? value) {
    _$checkAtom.reportWrite(value, super.check, () {
      super.check = value;
    });
  }

  late final _$importantAtom =
      Atom(name: 'TarefasModelBase.important', context: context);

  @override
  bool? get important {
    _$importantAtom.reportRead();
    return super.important;
  }

  @override
  set important(bool? value) {
    _$importantAtom.reportWrite(value, super.important, () {
      super.important = value;
    });
  }

  late final _$urgentAtom =
      Atom(name: 'TarefasModelBase.urgent', context: context);

  @override
  bool? get urgent {
    _$urgentAtom.reportRead();
    return super.urgent;
  }

  @override
  set urgent(bool? value) {
    _$urgentAtom.reportWrite(value, super.urgent, () {
      super.urgent = value;
    });
  }

  @override
  String toString() {
    return '''
title: ${title},
check: ${check},
important: ${important},
urgent: ${urgent}
    ''';
  }
}
