import 'package:apiexample/view/image_grid_screen.dart';
import 'package:apiexample/viewmodel/image_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// built using Model + Service + ViewModel cleanly. This is classic MVVM in Flutter using Provider.
void main() {
  runApp(const ImageGallaryActivity());
}

class ImageGallaryActivity extends StatelessWidget {
  const ImageGallaryActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ImageViewModel()..fetchImages(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const ImageGridScreen(),
      ),
    );
  }
}
