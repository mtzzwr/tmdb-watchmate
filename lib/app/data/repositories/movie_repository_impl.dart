import 'package:dartz/dartz.dart';
import 'package:tmdb_watchmate/app/core/errors/failure.dart';
import 'package:tmdb_watchmate/app/data/datasources/movie_datasource.dart';
import 'package:tmdb_watchmate/app/domain/entities/movie_details_entity.dart';
import 'package:tmdb_watchmate/app/domain/entities/movie_entity.dart';
import 'package:tmdb_watchmate/app/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies() {
    return datasource.getNowPlayingMovies();
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() {
    return datasource.getPopularMovies();
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(int id) {
    return datasource.getMovieDetails(id);
  }
}
