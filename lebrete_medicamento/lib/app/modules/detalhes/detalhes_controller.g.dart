// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalhes_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DetalhesController = BindInject(
  (i) => DetalhesController(i<IMedicamentoRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetalhesController on _DetalhesControllerBase, Store {
  Computed<ObservableFuture<List<DoseModel>>> _$listarDosesComputed;

  @override
  ObservableFuture<List<DoseModel>> get listarDoses =>
      (_$listarDosesComputed ??= Computed<ObservableFuture<List<DoseModel>>>(
              () => super.listarDoses,
              name: '_DetalhesControllerBase.listarDoses'))
          .value;

  final _$_listaDosesAtom = Atom(name: '_DetalhesControllerBase._listaDoses');

  @override
  ObservableFuture<List<DoseModel>> get _listaDoses {
    _$_listaDosesAtom.reportRead();
    return super._listaDoses;
  }

  @override
  set _listaDoses(ObservableFuture<List<DoseModel>> value) {
    _$_listaDosesAtom.reportWrite(value, super._listaDoses, () {
      super._listaDoses = value;
    });
  }

  final _$excluirMedicamentoAsyncAction =
      AsyncAction('_DetalhesControllerBase.excluirMedicamento');

  @override
  Future<bool> excluirMedicamento(int id) {
    return _$excluirMedicamentoAsyncAction
        .run(() => super.excluirMedicamento(id));
  }

  final _$_DetalhesControllerBaseActionController =
      ActionController(name: '_DetalhesControllerBase');

  @override
  dynamic init(int id) {
    final _$actionInfo = _$_DetalhesControllerBaseActionController.startAction(
        name: '_DetalhesControllerBase.init');
    try {
      return super.init(id);
    } finally {
      _$_DetalhesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listarDoses: ${listarDoses}
    ''';
  }
}
