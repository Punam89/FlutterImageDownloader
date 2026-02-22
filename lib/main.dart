import 'package:apiexample/databaseActivity.dart';
import 'package:apiexample/view/imageview_main.dart';
import 'package:flutter/material.dart';
// import 'package:apiexample/view/image_grid_screen.dart';
// import 'package:apiexample/viewmodel/image_view_model.dart';
// import 'package:provider/provider.dart';
import 'package:apiexample/navigateAcivity.dart';

// Main File
void main() {
  // App Entry Point
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ButtonScreen());
  }
}

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigation happens here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NavigateAcivity()),
                );
                print('Button 1 pressed');
              },
              child: Text('Navigation'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigation happens here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NavigateAcivity()),
                );
                print('Button 2 pressed');
              },
              child: Text('Firebase'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigation happens here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Databaseactivity()),
                );
                print('Button 3 pressed');
              },
              child: Text('Database'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigation happens here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageGallaryActivity(),
                  ),
                );
                print('Button 4 pressed');
              },
              child: Text('Image Gallary'),
            ),
          ],
        ),
      ),
    );
  }
}



// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => ImageViewModel()..fetchImages(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: const ImageGridScreen(),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       // This is the theme of your application.
  //       //
  //       // TRY THIS: Try running your application with "flutter run". You'll see
  //       // the application has a purple toolbar. Then, without quitting the app,
  //       // try changing the seedColor in the colorScheme below to Colors.green
  //       // and then invoke "hot reload" (save your changes or press the "hot
  //       // reload" button in a Flutter-supported IDE, or press "r" if you used
  //       // the command line to start the app).
  //       //
  //       // Notice that the counter didn't reset back to zero; the application
  //       // state is not lost during the reload. To reset the state, use hot
  //       // restart instead.
  //       //
  //       // This works for code too, not just values: Most code changes can be
  //       // tested with just a hot reload.
  //       colorScheme: .fromSeed(seedColor: Colors.deepPurple),
  //     ),
  //     debugShowCheckedModeBanner: false,
  //     home: const ImageGridScreen(),
  //   );
  // }
// }
