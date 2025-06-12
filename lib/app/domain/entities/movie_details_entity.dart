import 'package:tmdb_watchmate/app/domain/entities/movie_entity.dart';

class MovieDetailsEntity {
  final MovieEntity movie;
  final dynamic belongsToCollection;
  final num budget;
  final List<MovieGenresEntity> genres;
  final String homepage;
  final String imdbId;
  final List<String> originCountry;
  final List<ProductionCompaniesEntity> productionCompanies;
  final int revenue;
  final int runtime;
  final String status;
  final String tagline;

  MovieDetailsEntity({
    required this.movie,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.imdbId,
    required this.originCountry,
    required this.productionCompanies,
    required this.revenue,
    required this.runtime,
    required this.status,
    required this.tagline,
  });
}

class MovieGenresEntity {
  final int id;
  final String name;

  MovieGenresEntity({required this.id, required this.name});
}

class ProductionCompaniesEntity {
  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  ProductionCompaniesEntity({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });
}
