import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:accessibility_app/cards_app/screens/cards.dart';

// Custom text styles for the application
class CustomTextStyles {
  static const TextStyle displayMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    // Add more text styles properties as needed
  );
}

// Landing Keyboard Screen, allowing user to type and interact
class LandingKeyboardScreen extends StatefulWidget {
  final String? initialText; // Initial text to display, if any
  const LandingKeyboardScreen({Key? key, this.initialText}) : super(key: key);

  @override
  _LandingKeyboardScreenState createState() => _LandingKeyboardScreenState();
}

class _LandingKeyboardScreenState extends State<LandingKeyboardScreen> {
  late TextEditingController textEditingController; // Controller for text input
  bool isTextClicked = false; // Flag to track if text field is clicked
  final FlutterTts flutterTts = FlutterTts(); // Flutter Text to Speech instance

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(text: widget.initialText); // Initializing text controller with initial text
    initTts(); // Initializing Text to Speech engine
  }

  // Initialize Text to Speech engine
  Future<void> initTts() async {
    await flutterTts.setLanguage('en-US'); // Setting language
    await flutterTts.setSpeechRate(.10); // Adjusting speech rate
    await flutterTts.setVolume(1.0); // Setting volume
    await flutterTts.setPitch(1.0); // Setting pitch
  }

  @override
  void dispose() {
    textEditingController.dispose(); // Disposing text controller
    super.dispose();
  }

  // Function to speak the text
  Future<void> _speak() async {
    await flutterTts.speak(textEditingController.text); // Speaking the text from text field
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0), // Background color
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous screen
            },
          ),
          title:const Text('What is on your mind?'),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              _buildTwo(context), // Building the main UI elements
            ],
          ),
        ),
      ),
    );
  }

  // Building main UI elements
  Widget _buildTwo(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isTextClicked = true; // Setting flag to true when text field is clicked
            });
            // Request focus for the text field when tapped anywhere on the screen
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 27),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 11),
                  Align(
                    alignment: Alignment.center,
                    child: isTextClicked
                        ? TextField(
                            controller: textEditingController,
                            style: CustomTextStyles.displayMedium.copyWith(
                              color: Colors.grey,
                            ),
                            autofocus: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "",
                              hintStyle: CustomTextStyles.displayMedium.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                            onChanged: (value) {
                              // Handle text changes
                            },
                          )
                        : Text(
                            widget.initialText ?? "Type Something...",
                            style: CustomTextStyles.displayMedium.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          bottom: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Handle Draw button tap
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(vertical: 20),
                      ),
                    ),
                    child: Text(
                      'Draw',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Cards()), // Navigating to Cards screen
                      );
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(vertical: 20),
                      ),
                    ),
                    child: Text(
                      'Add card',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 50,
          child: GestureDetector(
            onTap: () {
              _speak(); // Initiating text to speech
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.all(10),
              child: Icon(Icons.record_voice_over), // Icon for text to speech
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LandingKeyboardScreen(), // Running the Landing Keyboard Screen as the main application
  ));
}
