class DogDto {
  final int fileSizeBytes;
  final String url;

  DogDto({required this.fileSizeBytes, required this.url});

  factory DogDto.fromJson(Map<String, dynamic> json) {
    return DogDto(fileSizeBytes: json['fileSizeBytes'], url: json['url']);
  }
}
