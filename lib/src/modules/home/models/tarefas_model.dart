// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TarefasModel {
  final String title;
  final bool check;
  final bool important;
  final bool urgent;

  TarefasModel(
      {required this.title,
      required this.check,
      required this.important,
      required this.urgent});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'check': check,
      'important': important,
      'urgent': urgent,
    };
  }

  factory TarefasModel.fromMap(Map<String, dynamic> map) {
    return TarefasModel(
      title: map['title'] as String,
      check: map['check'] as bool,
      important: map['important'] as bool,
      urgent: map['urgent'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TarefasModel.fromJson(String source) =>
      TarefasModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
