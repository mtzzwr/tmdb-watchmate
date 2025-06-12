import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:tmdb_watchmate/app/domain/entities/movie_details_entity.dart';
import 'package:tmdb_watchmate/app/presentation/stores/image_config_store.dart';
import 'package:tmdb_watchmate/app/presentation/stores/movie_store.dart';
import 'package:tmdb_watchmate/app/presentation/widgets/loading_movie_backdrop.dart';
import 'package:tmdb_watchmate/app/presentation/widgets/loading_movie_details.dart';
import 'package:tmdb_watchmate/app/presentation/widgets/loading_movie_poster.dart';
import 'package:tmdb_watchmate/app/presentation/widgets/star_average.dart';

class MovieDetailsPage extends StatelessWidget {
  final int id;

  MovieDetailsPage({super.key, required this.id});

  final movieStore = GetIt.I<MovieStore>();
  final imageConfigStore = GetIt.I<ImageConfigStore>();

  @override
  Widget build(BuildContext context) {
    movieStore.getMovieDetails(id);
    return Scaffold(
      backgroundColor: Color(0xff111111),
      body: Observer(
        builder: (_) {
          return SafeArea(
            top: movieStore.isLoading,
            child: SingleChildScrollView(
              child: Observer(
                builder: (_) {
                  final details = movieStore.movieDetails;
                  if (movieStore.isLoading) {
                    return LoadingMovieDetails();
                  }

                  return Column(
                    children: [
                      header(context, details!),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sinopse',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                            Text(
                              details.movie.overview.isNotEmpty
                                  ? details.movie.overview
                                  : 'Sinopse não disponível',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Gêneros',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(0),
                              itemCount: details.genres.length,
                              itemBuilder: (_, index) {
                                final genre = details.genres[index];

                                return Text(
                                  genre.name,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget header(BuildContext context, MovieDetailsEntity details) => SizedBox(
    height: 400,
    child: Stack(
      children: [
        Opacity(
          opacity: 0.9,
          child: SizedBox(
            child: CachedNetworkImage(
              imageUrl: imageConfigStore.getImageUrl(
                details.movie.backdropPath,
                'w780',
              ),
              placeholder: (context, url) => LoadingMovieBackdrop(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 40, 0, 0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 24),
          ),
        ),
        Positioned(
          top: 180,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: imageConfigStore.getImageUrl(
                      details.movie.posterPath,
                      'w185',
                    ),
                    height: 200,
                    placeholder: (context, url) => LoadingMoviePoster(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),

                  const SizedBox(width: 12),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          Text(
                            details.movie.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          const SizedBox(height: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    details.movie.voteAverage.toStringAsFixed(
                                      2,
                                    ),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'Média',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  StarRating(rating: details.movie.voteAverage),
                                  Text(
                                    'Avaliações',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
