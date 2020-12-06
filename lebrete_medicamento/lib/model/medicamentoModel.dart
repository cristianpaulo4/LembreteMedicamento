import 'dart:convert';

class MedicamentoModel {
  int id;
  bool comprimido;
  String nome;
  String descricao;
  int qtdTotal;
  int qtdDiaria;
  int intervalos;
  MedicamentoModel({
    this.id,
    this.comprimido,
    this.nome,
    this.descricao,
    this.qtdTotal,
    this.qtdDiaria,
    this.intervalos,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'descricao': descricao,
      'qtdTotal': qtdTotal,
      'qtdDiaria': qtdDiaria,
      'intervalos': intervalos,
      'comprimido': comprimido ? 1 : 0,
    };
  }

  factory MedicamentoModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MedicamentoModel(
      id: map['id'],
      comprimido: map['comprimido'] == 1 ? true : false,
      nome: map['nome'],
      descricao: map['descricao'],
      qtdTotal: map['qtdTotal'],
      qtdDiaria: map['qtdDiaria'],
      intervalos: map['intervalos'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicamentoModel.fromJson(String source) =>
      MedicamentoModel.fromMap(json.decode(source));
}
