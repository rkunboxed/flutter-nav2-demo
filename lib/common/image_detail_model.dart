class ImageDetail {
  final String filename;
  final String country;
  final String photographer;

  ImageDetail({required this.filename, required this.country, required this.photographer});

  factory ImageDetail.fromJson(Map<String, dynamic> json) {
    return ImageDetail(
      filename: json['filename'] ?? 'unknown',
      country: json['location'] ?? 'unknown',
      photographer: json['photographer'] ?? 'unknown',
    );
  }
}
