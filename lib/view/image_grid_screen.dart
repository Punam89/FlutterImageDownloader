import 'package:apiexample/viewmodel/image_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//  View Layer (UI)
class ImageGridScreen extends StatelessWidget {
  const ImageGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  Provider creates ViewModel
    // ..fetchImages() calls API immediately
    return Scaffold(
      appBar: AppBar(title: Text("Pixabay Gallery")),
      body: Consumer<ImageViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (vm.errorMessage.isNotEmpty) {
            return Center(child: Text(vm.errorMessage));
          }

          // GridView Builder
          return GridView.builder(
            padding: EdgeInsets.all(8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: vm.images.length,
            itemBuilder: (context, index) {
              // Image Loading => CachedNetworkImage =>
              // Image caching
              // Faster reload
              // Offline support
              // Placeholder & error support
              return CachedNetworkImage(
                imageUrl: vm.images[index].imageUrl,
                fit: BoxFit.cover,
              );
            },
          );
        },
      ),
    );
  }
}
