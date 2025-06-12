import 'package:dartz/dartz.dart';
import 'package:tmdb_watchmate/app/core/errors/failure.dart';
import 'package:tmdb_watchmate/app/data/datasources/image_config_datasource.dart';
import 'package:tmdb_watchmate/app/domain/entities/image_config_entity.dart';
import 'package:tmdb_watchmate/app/domain/repositories/image_config_repository.dart';

class ImageConfigRepositoryImpl implements ImageConfigRepository {
  final ImageConfigDatasource datasource;

  ImageConfigRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, ImageConfigEntity>> getImageConfig() {
    return datasource.getImageConfig();
  }
}
