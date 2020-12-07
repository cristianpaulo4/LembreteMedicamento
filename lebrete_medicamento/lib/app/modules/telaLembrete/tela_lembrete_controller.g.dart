// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tela_lembrete_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $TelaLembreteController = BindInject(
  (i) => TelaLembreteController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TelaLembreteController on _TelaLembreteControllerBase, Store {
  Computed<ObservableFuture<List<Map<dynamic, dynamic>>>>
      _$listarLembreteComputed;

  @override
  ObservableFuture<List<Map<dynamic, dynamic>>> get listarLembrete =>
      (_$listarLembreteComputed ??=
              Computed<ObservableFuture<List<Map<dynamic, dynamic>>>>(
                  () => super.listarLembrete,
                  name: '_TelaLembreteControllerBase.listarLembrete'))
          .value;

  final _$_listaDosesAtom =
      Atom(name: '_TelaLembreteControllerBase._listaDoses');

  @override
  ObservableFuture<List<Map<dynamic, dynamic>>> get _listaDoses {
    _$_listaDosesAtom.reportRead();
    return super._listaDoses;
  }

  @override
  set _listaDoses(ObservableFuture<List<Map<dynamic, dynamic>>> value) {
    _$_listaDosesAtom.reportWrite(value, super._listaDoses, () {
      super._listaDoses = value;
    });
  }

  final _$_TelaLembreteControllerBaseActionController =
      ActionController(name: '_TelaLembreteControllerBase');

  @override
  dynamic _init() {
    final _$actionInfo = _$_TelaLembreteControllerBaseActionController
        .startAction(name: '_TelaLembreteControllerBase._init');
    try {
      return super._init();
    } finally {
      _$_TelaLembreteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listarLembrete: ${listarLembrete}
    ''';
  }
}
