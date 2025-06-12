import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdb_watchmate/app/core/errors/failure.dart';
import 'package:tmdb_watchmate/app/domain/entities/image_config_entity.dart';
import 'package:tmdb_watchmate/app/domain/usecases/get_image_config_usecase.dart';
part 'image_config_store.g.dart';

class ImageConfigStore = _ImageConfigStoreBase with _$ImageConfigStore;

abstract class _ImageConfigStoreBase with Store {
  final GetImageConfigUsecase _getImageConfigUsecase;

  _ImageConfigStoreBase(this._getImageConfigUsecase);

  @observable
  ImageConfigEntity? imageConfig;

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @action
  Future<void> getImageConfig() async {
    isLoading = true;
    try {
      final Either<Failure, ImageConfigEntity> result =
          await _getImageConfigUsecase();

      result.fold((failure) => errorMessage = failure.message, (config) {
        imageConfig = config;
      });
    } finally {
      isLoading = false;
    }
  }

  String getImageUrl(String path, String size) {
    if (imageConfig == null) return '';
    return '${imageConfig!.baseUrl}$size$path';
  }
}
