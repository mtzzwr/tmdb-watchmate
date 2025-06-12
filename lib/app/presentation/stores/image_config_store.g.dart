// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_config_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImageConfigStore on _ImageConfigStoreBase, Store {
  late final _$imageConfigAtom = Atom(
    name: '_ImageConfigStoreBase.imageConfig',
    context: context,
  );

  @override
  ImageConfigEntity? get imageConfig {
    _$imageConfigAtom.reportRead();
    return super.imageConfig;
  }

  @override
  set imageConfig(ImageConfigEntity? value) {
    _$imageConfigAtom.reportWrite(value, super.imageConfig, () {
      super.imageConfig = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_ImageConfigStoreBase.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_ImageConfigStoreBase.errorMessage',
    context: context,
  );

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$getImageConfigAsyncAction = AsyncAction(
    '_ImageConfigStoreBase.getImageConfig',
    context: context,
  );

  @override
  Future<void> getImageConfig() {
    return _$getImageConfigAsyncAction.run(() => super.getImageConfig());
  }

  @override
  String toString() {
    return '''
imageConfig: ${imageConfig},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}
