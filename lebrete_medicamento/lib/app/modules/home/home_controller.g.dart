// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<IMedicamentoRepository>(), i<BancoLocal>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<List<Map<dynamic, dynamic>>> _$listarMedicamentosComputed;

  @override
  List<Map<dynamic, dynamic>> get listarMedicamentos =>
      (_$listarMedicamentosComputed ??= Computed<List<Map<dynamic, dynamic>>>(
              () => super.listarMedicamentos,
              name: '_HomeControllerBase.listarMedicamentos'))
          .value;

  final _$_medicamentosAtom = Atom(name: '_HomeControllerBase._medicamentos');

  @override
  ObservableStream<List<Map<dynamic, dynamic>>> get _medicamentos {
    _$_medicamentosAtom.reportRead();
    return super._medicamentos;
  }

  @override
  set _medicamentos(ObservableStream<List<Map<dynamic, dynamic>>> value) {
    _$_medicamentosAtom.reportWrite(value, super._medicamentos, () {
      super._medicamentos = value;
    });
  }

  @override
  String toString() {
    return '''
listarMedicamentos: ${listarMedicamentos}
    ''';
  }
}
