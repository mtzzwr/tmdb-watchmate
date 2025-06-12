import 'package:dartz/dartz.dart';
import 'package:tmdb_watchmate/app/core/errors/failure.dart';
import 'package:tmdb_watchmate/app/domain/entities/movie_details_entity.dart';
import 'package:tmdb_watchmate/app/domain/repositories/movie_repository.dart';

class GetMovieDetailsUsecase {
  final MovieRepository repository;

  GetMovieDetailsUsecase(this.repository);

  Future<Either<Failure, MovieDetailsEntity>> call(int id) =>
      repository.getMovieDetails(id);
}
