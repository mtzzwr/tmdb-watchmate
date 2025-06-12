import 'package:dartz/dartz.dart';
import 'package:tmdb_watchmate/app/core/errors/failure.dart';
import 'package:tmdb_watchmate/app/core/network/client.dart';
import 'package:tmdb_watchmate/app/data/datasources/movie_datasource.dart';
import 'package:tmdb_watchmate/app/data/models/movie_details_model.dart';
import 'package:tmdb_watchmate/app/data/models/movie_model.dart';
import 'package:tmdb_watchmate/app/domain/entities/movie_details_entity.dart';

class MovieDatasourceImpl implements MovieDatasource {
  final Client client;

  MovieDatasourceImpl(this.client);

  @override
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies() async {
    try {
      final response = await client.get(
        '/movie/now_playing',
        queryParameters: {'page': '1'},
      );

      if (response.statusCode == 200) {
        final list = MovieModel.fromJsonList(response.data['results']);
        return Right(list);
      }

      return Left(DefaultFailure('Ocorreu uma falha durante a requisição'));
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getPopularMovies() async {
    try {
      final response = await client.get(
        '/movie/popular',
        queryParameters: {'page': '1'},
      );

      if (response.statusCode == 200) {
        final list = MovieModel.fromJsonList(response.data['results']);
        return Right(list);
      }

      return Left(DefaultFailure('Ocorreu uma falha durante a requisição'));
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(int id) async {
    try {
      final response = await client.get('/movie/$id');

      if (response.statusCode == 200) {
        final movie = MovieDetailsModel.fromJson(response.data);
        return Right(movie);
      }

      return Left(DefaultFailure('Ocorreu uma falha durante a requisição'));
    } catch (e) {
      throw Exception(e);
    }
  }
}
