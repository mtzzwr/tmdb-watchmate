import 'package:tmdb_watchmate/app/data/models/movie_model.dart';
import 'package:tmdb_watchmate/app/domain/entities/movie_details_entity.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  MovieDetailsModel({
    required super.movie,
    required super.belongsToCollection,
    required super.budget,
    required super.genres,
    required super.homepage,
    required super.imdbId,
    required super.originCountry,
    required super.productionCompanies,
    required super.revenue,
    required super.runtime,
    required super.status,
    required super.tagline,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    List<String> originCountry = [];
    if (json['origin_country'] != null) {
      for (final country in json['origin_country']) {
        originCountry = List.from(originCountry..add(country));
      }
    }

    return MovieDetailsModel(
      movie: MovieModel.fromJson(json),
      belongsToCollection: json['belongs_to_collection'],
      budget: json['budget'],
      genres: MovieGenresModel.fromJsonList(json['genres']),
      homepage: json['homepage'],
      imdbId: json['imdb_id'],
      originCountry: originCountry,
      productionCompanies: ProductionCompaniesModel.fromJsonList(
        json['production_companies'],
      ),
      revenue: json['revenue'],
      runtime: json['runtime'],
      status: json['status'],
      tagline: json['tagline'],
    );
  }
}

class MovieGenresModel extends MovieGenresEntity {
  MovieGenresModel({required super.id, required super.name});

  factory MovieGenresModel.fromJson(Map<String, dynamic> json) {
    return MovieGenresModel(id: json['id'], name: json['name']);
  }

  static List<MovieGenresModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => MovieGenresModel.fromJson(json)).toList();
  }
}

class ProductionCompaniesModel extends ProductionCompaniesEntity {
  ProductionCompaniesModel({
    required super.id,
    required super.logoPath,
    required super.name,
    required super.originCountry,
  });

  factory ProductionCompaniesModel.fromJson(Map<String, dynamic> json) {
    return ProductionCompaniesModel(
      id: json['id'],
      logoPath: json['logo_path'] ?? '',
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }

  static List<ProductionCompaniesModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => ProductionCompaniesModel.fromJson(json))
        .toList();
  }
}
