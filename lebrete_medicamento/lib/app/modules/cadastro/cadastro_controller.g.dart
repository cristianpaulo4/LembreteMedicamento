// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CadastroController = BindInject(
  (i) => CadastroController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroController on _CadastroControllerBase, Store {
  final _$cadastroMedicamentoAsyncAction =
      AsyncAction('_CadastroControllerBase.cadastroMedicamento');

  @override
  Future<dynamic> cadastroMedicamento(
      MedicamentoModel model, DateTime dateTime) {
    return _$cadastroMedicamentoAsyncAction
        .run(() => super.cadastroMedicamento(model, dateTime));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
