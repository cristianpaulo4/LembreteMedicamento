import 'dart:convert';

class DoseModel {
  int id;
  String time;
  int idMedicamento;
  bool ok;
  DoseModel({
    this.id,
    this.time,
    this.idMedicamento,
    this.ok,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'time': time,
      'idMedicamento': idMedicamento,
      'ok': ok,
    };
  }

  factory DoseModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return DoseModel(
      id: map['id'],
      time: map['time'],
      idMedicamento: map['idMedicamento'],
      ok: map['ok'] == 1,
    );
  }

  String toJson() => json.encode(toMap());

  factory DoseModel.fromJson(String source) =>
      DoseModel.fromMap(json.decode(source));
}
