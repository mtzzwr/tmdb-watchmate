import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:tmdb_watchmate/app/presentation/stores/image_config_store.dart';
import 'package:tmdb_watchmate/app/presentation/stores/movie_store.dart';
import 'package:tmdb_watchmate/app/presentation/widgets/loading_movie_card.dart';
import 'package:tmdb_watchmate/app/presentation/widgets/movie_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final movieStore = GetIt.I<MovieStore>();
  final imageConfigStore = GetIt.I<ImageConfigStore>();

  @override
  Widget build(BuildContext context) {
    imageConfigStore.getImageConfig();
    movieStore.getNowPlayingMovies();
    movieStore.getPopularMovies();
    return Scaffold(
      backgroundColor: Color(0xff111111),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TMDB WatchMate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 30),

                Row(
                  spacing: 6,
                  children: [
                    Icon(Icons.movie_creation_outlined, color: Colors.white),
                    Text(
                      'Filmes em cartaz',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                SizedBox(
                  height: 350,
                  child: Observer(
                    builder: (_) {
                      return ListView.builder(
                        itemCount: movieStore.nowPlayingMovies.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          if (movieStore.isLoading) {
                            return LoadingMovieCard();
                          }

                          final movie = movieStore.nowPlayingMovies[index];
                          return MovieCard(movie: movie);
                        },
                      );
                    },
                  ),
                ),

                const SizedBox(height: 30),

                Row(
                  spacing: 6,
                  children: [
                    Icon(Icons.trending_up, color: Colors.white),
                    Text(
                      'Filmes populares',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                SizedBox(
                  height: 350,
                  child: Observer(
                    builder: (_) {
                      return ListView.builder(
                        itemCount: movieStore.popularMovies.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          if (movieStore.isLoading) {
                            return LoadingMovieCard();
                          }

                          final movie = movieStore.popularMovies[index];
                          return MovieCard(movie: movie);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
