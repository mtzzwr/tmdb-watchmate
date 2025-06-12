class ImageConfigEntity {
  final String baseUrl;
  final List<String> posterSizes;
  final List<String> backdropSizes;

  ImageConfigEntity({
    required this.baseUrl,
    required this.posterSizes,
    required this.backdropSizes,
  });
}
