import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdb_watchmate/app/core/errors/failure.dart';
import 'package:tmdb_watchmate/app/domain/entities/movie_details_entity.dart';
import 'package:tmdb_watchmate/app/domain/entities/movie_entity.dart';
import 'package:tmdb_watchmate/app/domain/usecases/get_movie_details_usecase.dart';
import 'package:tmdb_watchmate/app/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:tmdb_watchmate/app/domain/usecases/get_popular_movies_usecase.dart';
part 'movie_store.g.dart';

class MovieStore = _MovieStoreBase with _$MovieStore;

abstract class _MovieStoreBase with Store {
  final GetNowPlayingMoviesUsecase _getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase _getPopularMoviesUsecase;
  final GetMovieDetailsUsecase _getMovieDetailsUsecase;

  _MovieStoreBase(
    this._getNowPlayingMoviesUsecase,
    this._getPopularMoviesUsecase,
    this._getMovieDetailsUsecase,
  );

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @observable
  ObservableList<MovieEntity> nowPlayingMovies = ObservableList();

  @observable
  ObservableList<MovieEntity> popularMovies = ObservableList();

  @observable
  MovieDetailsEntity? movieDetails;

  @action
  Future<void> getNowPlayingMovies() async {
    isLoading = true;
    try {
      final Either<Failure, List<MovieEntity>> result =
          await _getNowPlayingMoviesUsecase();

      result.fold((failure) => errorMessage = failure.message, (list) {
        nowPlayingMovies.clear();
        nowPlayingMovies.addAll(list);
      });
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> getPopularMovies() async {
    isLoading = true;
    try {
      final Either<Failure, List<MovieEntity>> result =
          await _getPopularMoviesUsecase();

      result.fold((failure) => errorMessage = failure.message, (list) {
        popularMovies.clear();
        popularMovies.addAll(list);
      });
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> getMovieDetails(int id) async {
    isLoading = true;
    try {
      final Either<Failure, MovieDetailsEntity> result =
          await _getMovieDetailsUsecase(id);

      result.fold((failure) => errorMessage = failure.message, (movie) {
        movieDetails = null;
        movieDetails = movie;
      });
    } finally {
      isLoading = false;
    }
  }
}
