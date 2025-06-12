import 'package:dartz/dartz.dart';
import 'package:tmdb_watchmate/app/core/errors/failure.dart';
import 'package:tmdb_watchmate/app/domain/entities/movie_entity.dart';
import 'package:tmdb_watchmate/app/domain/repositories/movie_repository.dart';

class GetNowPlayingMoviesUsecase {
  final MovieRepository repository;

  GetNowPlayingMoviesUsecase(this.repository);

  Future<Either<Failure, List<MovieEntity>>> call() =>
      repository.getNowPlayingMovies();
}
