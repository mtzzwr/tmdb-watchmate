import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tmdb_watchmate/app/core/utils/utils.dart';
import 'package:tmdb_watchmate/app/domain/entities/movie_entity.dart';
import 'package:tmdb_watchmate/app/presentation/stores/image_config_store.dart';
import 'package:tmdb_watchmate/app/presentation/widgets/loading_movie_card.dart';

class MovieCard extends StatelessWidget {
  final MovieEntity movie;

  MovieCard({super.key, required this.movie});

  final imageConfigStore = GetIt.I<ImageConfigStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.pushNamed(
            context,
            '/movie_details',
            arguments: movie.id,
          ),
      child: Container(
        width: 185,
        height: 280,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: imageConfigStore.getImageUrl(
                  movie.posterPath,
                  'w185',
                ),
                placeholder:
                    (context, url) => LoadingMovieCard(onlyImage: true),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Text(
                movie.title,
                style: TextStyle(color: Colors.white, fontSize: 16),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              Utils.formatDate(movie.releaseDate),
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
