import 'dart:convert';
import 'package:apiexample/model/pixabay_image.dart';
import 'package:http/http.dart' as http;

// Service Layer (API Call)
class PixabayApiService {
  //  static const =>
  // static → same value shared across app
  // const → compile-time constant
  // _ → private (encapsulation)
  static const String _apiKey = "20556304-1e1a5855144c40a60866da061";
  static const String _baseUrl = "https://pixabay.com/api/";

  // Future   =>  Async operation
  // async / await   =>  Non-blocking network call
  // HTTP GET   =>  Fetch data from server
  Future<List<PixabayImage>> fetchImages() async {
    // Building URL => this calls api url
    final url = Uri.parse(
      '$_baseUrl?key=$_apiKey&image_type=photo&per_page=50',
    );

    final response = await http.get(url);

    // API Response Handling
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List hits = data['hits'];

      //  Mapping JSON → Model
      // Converts List<Map> → List<PixabayImage>
      return hits.map((e) => PixabayImage.fromJson(e)).toList();
    } else {
      // If API fails → ViewModel handles it.
      throw Exception("Failed to load images");
    }
  }
}
