import 'package:dartz/dartz.dart';
import 'package:tmdb_watchmate/app/core/errors/failure.dart';
import 'package:tmdb_watchmate/app/domain/entities/image_config_entity.dart';

abstract class ImageConfigDatasource {
  Future<Either<Failure, ImageConfigEntity>> getImageConfig();
}
