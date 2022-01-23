// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_navigation_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $BottomNavigationController = BindInject(
  (i) => BottomNavigationController(),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BottomNavigationController on _BottomNavigationControllerBase, Store {
  Computed<bool>? _$pageInitComputed;

  @override
  bool get pageInit =>
      (_$pageInitComputed ??= Computed<bool>(() => super.pageInit,
              name: '_BottomNavigationControllerBase.pageInit'))
          .value;

  final _$pageIndexAtom =
      Atom(name: '_BottomNavigationControllerBase.pageIndex');

  @override
  int get pageIndex {
    _$pageIndexAtom.reportRead();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.reportWrite(value, super.pageIndex, () {
      super.pageIndex = value;
    });
  }

  final _$_BottomNavigationControllerBaseActionController =
      ActionController(name: '_BottomNavigationControllerBase');

  @override
  void selectedPage(int index) {
    final _$actionInfo = _$_BottomNavigationControllerBaseActionController
        .startAction(name: '_BottomNavigationControllerBase.selectedPage');
    try {
      return super.selectedPage(index);
    } finally {
      _$_BottomNavigationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageIndex: ${pageIndex},
pageInit: ${pageInit}
    ''';
  }
}
