import 'package:dartz/dartz.dart';
import 'package:tmdb_watchmate/app/core/errors/failure.dart';
import 'package:tmdb_watchmate/app/core/network/client.dart';
import 'package:tmdb_watchmate/app/data/datasources/image_config_datasource.dart';
import 'package:tmdb_watchmate/app/data/models/image_config_model.dart';
import 'package:tmdb_watchmate/app/domain/entities/image_config_entity.dart';

class ImageConfigDatasourceImpl implements ImageConfigDatasource {
  final Client client;

  ImageConfigDatasourceImpl(this.client);

  @override
  Future<Either<Failure, ImageConfigEntity>> getImageConfig() async {
    try {
      final response = await client.get('/configuration');

      if (response.statusCode == 200) {
        final imageConfig = ImageConfigModel.fromJson(response.data['images']);
        return Right(imageConfig);
      }

      return Left(DefaultFailure('Ocorreu uma falha durante a requisição'));
    } catch (e) {
      throw Exception(e);
    }
  }
}
