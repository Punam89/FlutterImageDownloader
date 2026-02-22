import 'package:apiexample/model/pixabay_image.dart';
import 'package:apiexample/service/pixabay_api_service.dart';
import 'package:flutter/material.dart';

// ViewModel Layer (Business Logic)
// Holds state
// Contains business logic
// Separates UI from data logic (MVVM)

// ImageViewModel are UI-related states.
// ViewModel is responsible for:
// Holding UI state (loading, error, data)
// Managing business logic
// Communicating with repository/service
// Notifying UI when state changes
class ImageViewModel extends ChangeNotifier {
  final PixabayApiService _apiService = PixabayApiService();

  List<PixabayImage> images = [];
  bool isLoading = false;
  String errorMessage = '';

  Future<void> fetchImages() async {
    //show loading
    isLoading = true;
    errorMessage = '';
    notifyListeners(); // it will tells UI “State changed, rebuild!”

    try {
      // API call
      images = await _apiService.fetchImages();
    } catch (e) {
      // handle error
      errorMessage = 'Failed to load images';
    } finally {
      // stop loading
      isLoading = false;
      notifyListeners();
    }
  }
}
