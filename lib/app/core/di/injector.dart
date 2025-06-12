import 'package:get_it/get_it.dart';
import 'package:tmdb_watchmate/app/core/network/client.dart';
import 'package:tmdb_watchmate/app/data/datasources/image_config_datasource_impl.dart';
import 'package:tmdb_watchmate/app/data/datasources/movie_datasource_impl.dart';
import 'package:tmdb_watchmate/app/data/repositories/image_config_repository_impl.dart';
import 'package:tmdb_watchmate/app/data/repositories/movie_repository_impl.dart';
import 'package:tmdb_watchmate/app/domain/usecases/get_image_config_usecase.dart';
import 'package:tmdb_watchmate/app/domain/usecases/get_movie_details_usecase.dart';
import 'package:tmdb_watchmate/app/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:tmdb_watchmate/app/domain/usecases/get_popular_movies_usecase.dart';
import 'package:tmdb_watchmate/app/presentation/stores/image_config_store.dart';
import 'package:tmdb_watchmate/app/presentation/stores/movie_store.dart';

class Injector {
  static void init() {
    GetIt.I.registerLazySingleton(() => Client());

    final client = GetIt.I<Client>();

    final movieDatasource = MovieDatasourceImpl(client);
    final movieRepository = MovieRepositoryImpl(movieDatasource);

    final getNowPlayingMoviesUsecase = GetNowPlayingMoviesUsecase(
      movieRepository,
    );
    final getPopularMoviesUsecase = GetPopularMoviesUsecase(movieRepository);
    final getMovieDetailsUsecase = GetMovieDetailsUsecase(movieRepository);

    GetIt.I.registerLazySingleton(
      () => MovieStore(
        getNowPlayingMoviesUsecase,
        getPopularMoviesUsecase,
        getMovieDetailsUsecase,
      ),
    );

    final imageConfigDatasource = ImageConfigDatasourceImpl(client);
    final imageConfigRepository = ImageConfigRepositoryImpl(
      imageConfigDatasource,
    );

    final getImageConfigUsecase = GetImageConfigUsecase(imageConfigRepository);

    GetIt.I.registerLazySingleton(
      () => ImageConfigStore(getImageConfigUsecase),
    );
  }
}
