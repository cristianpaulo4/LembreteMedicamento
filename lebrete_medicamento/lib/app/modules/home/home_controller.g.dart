// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(),
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
  Computed<List<Map<dynamic, dynamic>>> _$getMedicamentoEmDiaComputed;

  @override
  List<Map<dynamic, dynamic>> get getMedicamentoEmDia =>
      (_$getMedicamentoEmDiaComputed ??= Computed<List<Map<dynamic, dynamic>>>(
              () => super.getMedicamentoEmDia,
              name: '_HomeControllerBase.getMedicamentoEmDia'))
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

  final _$_medicamentosEmDiaAtom =
      Atom(name: '_HomeControllerBase._medicamentosEmDia');

  @override
  ObservableStream<List<Map<dynamic, dynamic>>> get _medicamentosEmDia {
    _$_medicamentosEmDiaAtom.reportRead();
    return super._medicamentosEmDia;
  }

  @override
  set _medicamentosEmDia(ObservableStream<List<Map<dynamic, dynamic>>> value) {
    _$_medicamentosEmDiaAtom.reportWrite(value, super._medicamentosEmDia, () {
      super._medicamentosEmDia = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_HomeControllerBase.init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$verificarLembreteAsyncAction =
      AsyncAction('_HomeControllerBase.verificarLembrete');

  @override
  Future verificarLembrete() {
    return _$verificarLembreteAsyncAction.run(() => super.verificarLembrete());
  }

  @override
  String toString() {
    return '''
listarMedicamentos: ${listarMedicamentos},
getMedicamentoEmDia: ${getMedicamentoEmDia}
    ''';
  }
}
