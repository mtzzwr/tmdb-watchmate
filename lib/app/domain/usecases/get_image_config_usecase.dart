import 'package:dartz/dartz.dart';
import 'package:tmdb_watchmate/app/core/errors/failure.dart';
import 'package:tmdb_watchmate/app/domain/entities/image_config_entity.dart';
import 'package:tmdb_watchmate/app/domain/repositories/image_config_repository.dart';

class GetImageConfigUsecase {
  final ImageConfigRepository repository;

  GetImageConfigUsecase(this.repository);

  Future<Either<Failure, ImageConfigEntity>> call() =>
      repository.getImageConfig();
}
