// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieStore on _MovieStoreBase, Store {
  late final _$isLoadingAtom = Atom(
    name: '_MovieStoreBase.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_MovieStoreBase.errorMessage',
    context: context,
  );

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$nowPlayingMoviesAtom = Atom(
    name: '_MovieStoreBase.nowPlayingMovies',
    context: context,
  );

  @override
  ObservableList<MovieEntity> get nowPlayingMovies {
    _$nowPlayingMoviesAtom.reportRead();
    return super.nowPlayingMovies;
  }

  @override
  set nowPlayingMovies(ObservableList<MovieEntity> value) {
    _$nowPlayingMoviesAtom.reportWrite(value, super.nowPlayingMovies, () {
      super.nowPlayingMovies = value;
    });
  }

  late final _$popularMoviesAtom = Atom(
    name: '_MovieStoreBase.popularMovies',
    context: context,
  );

  @override
  ObservableList<MovieEntity> get popularMovies {
    _$popularMoviesAtom.reportRead();
    return super.popularMovies;
  }

  @override
  set popularMovies(ObservableList<MovieEntity> value) {
    _$popularMoviesAtom.reportWrite(value, super.popularMovies, () {
      super.popularMovies = value;
    });
  }

  late final _$movieDetailsAtom = Atom(
    name: '_MovieStoreBase.movieDetails',
    context: context,
  );

  @override
  MovieDetailsEntity? get movieDetails {
    _$movieDetailsAtom.reportRead();
    return super.movieDetails;
  }

  @override
  set movieDetails(MovieDetailsEntity? value) {
    _$movieDetailsAtom.reportWrite(value, super.movieDetails, () {
      super.movieDetails = value;
    });
  }

  late final _$getNowPlayingMoviesAsyncAction = AsyncAction(
    '_MovieStoreBase.getNowPlayingMovies',
    context: context,
  );

  @override
  Future<void> getNowPlayingMovies() {
    return _$getNowPlayingMoviesAsyncAction.run(
      () => super.getNowPlayingMovies(),
    );
  }

  late final _$getPopularMoviesAsyncAction = AsyncAction(
    '_MovieStoreBase.getPopularMovies',
    context: context,
  );

  @override
  Future<void> getPopularMovies() {
    return _$getPopularMoviesAsyncAction.run(() => super.getPopularMovies());
  }

  late final _$getMovieDetailsAsyncAction = AsyncAction(
    '_MovieStoreBase.getMovieDetails',
    context: context,
  );

  @override
  Future<void> getMovieDetails(int id) {
    return _$getMovieDetailsAsyncAction.run(() => super.getMovieDetails(id));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
nowPlayingMovies: ${nowPlayingMovies},
popularMovies: ${popularMovies},
movieDetails: ${movieDetails}
    ''';
  }
}
