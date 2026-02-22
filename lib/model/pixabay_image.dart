// This is your Model class.
// Represents one image object from Pixabay API
// Holds only data, no UI or logic

// final    => Value cannot change after object creation (immutability)
class PixabayImage {
  final String imageUrl;

  // Constructor => Used to create object
  PixabayImage({required this.imageUrl});

  // factory constructor  =>  Creates object from JSON
  // fromJson   =>  Converts API response → Dart object
  // webformatURL
  // Pixabay API returns many URLs:
  // previewURL (small)
  // webformatURL (medium – best for grid)
  // largeImageURL (big)

  factory PixabayImage.fromJson(Map<String, dynamic> json) {
    return PixabayImage(imageUrl: json['webformatURL']);
  }
}
