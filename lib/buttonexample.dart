import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/* Punam */

void main() {
  runApp(const MyApp()); //entry point
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // build() draws the screen
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ButtonExample(), // Home page
    );
  }
}

// State applied to button
class ButtonExample extends StatefulWidget {
  const ButtonExample({super.key});

  @override
  State<ButtonExample> createState() => _ButtonExampleState(); // called once and connect buttonExample with its state
}

// _ButtonExampleState holds all changeable UI data
// _ means private
class _ButtonExampleState extends State<ButtonExample> {
  String buttonText1 = "Button1";
  String buttonText2 = "Button2";

  void initstate() {
    super.initState();
    print(" initState ");
  }

  // build() draws the screen re-calls whenever state changes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stateful Button")),
      body: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              // state Management, used only for state updates
              setState(() {
                buttonText1 = "Button1";
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StatefulButtonPage(),
                ),
              );
            },
            child: Text(buttonText1),
          ),
          ElevatedButton(
            onPressed: () {
              // state Management, used only for state updates
              setState(() {
                buttonText2 = "Button2";
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StatefulButtonPage(),
                ),
              );
            },
            child: Text(buttonText2),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print(" dispose ");
  }
}

//Second Page
class StatefulButtonPage extends StatefulWidget {
  const StatefulButtonPage({super.key});

  @override
  _StatefulButtonPageState createState() => _StatefulButtonPageState();
}

// no UI change
// static screen

class _StatefulButtonPageState extends State<StatefulButtonPage> {
  String buttonText = "Press Me"; // Initial button text
  final TextEditingController _controller =
      TextEditingController(); // For TextField input

  void initstate() {
    super.initState();
    print(" initState ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stateful Button")),

      /* body: Column(
            children: const [
              Text("Second Page"),
              Text("Redirected to Second Page")
            ]
        ),*/
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            // Top element: A title text
            const Text(
              'Enter details and press the button',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20), // Space below title
            // First Row: TextField and Button
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Enter text',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      buttonText = "Button Clicked!";
                      Fluttertoast.showToast(
                        msg: "Hello ${_controller.text}",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    });
                    print('TextField input: ${_controller.text}');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ButtonExample(),
                      ),
                    );
                  },
                  child: Text(buttonText),
                ),
              ],
            ),

            const SizedBox(height: 20), // Space between rows
            // Second Row: Additional elements (e.g., another button)
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center horizontally
              children: [
                const Text('Additional info: '),
                ElevatedButton(
                  onPressed: () {
                    // Example action: Show a snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Secondary button pressed!'),
                      ),
                    );
                  },
                  child: const Text('Secondary Button'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    print(" dispose ");
  }
}
