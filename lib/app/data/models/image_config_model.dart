import 'package:tmdb_watchmate/app/domain/entities/image_config_entity.dart';

class ImageConfigModel extends ImageConfigEntity {
  ImageConfigModel({
    required super.baseUrl,
    required super.posterSizes,
    required super.backdropSizes,
  });

  factory ImageConfigModel.fromJson(Map<String, dynamic> json) {
    return ImageConfigModel(
      baseUrl: json['secure_base_url'],
      posterSizes: List<String>.from(json['poster_sizes']),
      backdropSizes: List<String>.from(json['backdrop_sizes']),
    );
  }
}
