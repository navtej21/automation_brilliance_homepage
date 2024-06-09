import 'package:automation_brilliance_homepage/chatbot/messages.dart';
import 'package:flutter/material.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(brightness: Brightness.dark),
    home: ChatBot(),
  ));
}

class ChatBot extends StatelessWidget {
  ChatBot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DialogFlowtter dialogFlowtter;
  TextEditingController text = TextEditingController();

  @override
  void initState() {
    super.initState();
    initializeDialogFlowtter();
  }

  void initializeDialogFlowtter() async {
    dialogFlowtter = await DialogFlowtter.fromFile();
  }

  void addmessage(String text, [bool isuser = false]) {
    messages.add({"message": text, "isuser": isuser});
  }

  void sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else if (dialogFlowtter != null) {
      setState(() {
        addmessage(text, true);
      });

      try {
        DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)),
        );

        if (response.message != null) {
          setState(() {
            addmessage(response.message!.text!.text![0], false);
          });
        }
      } catch (e) {
        print('Error sending message: $e');
      }
    } else {
      print('DialogFlowtter is not initialized.');
    }
  }

  List<Map<String, dynamic>> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AiBot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Messagescreen(messages: messages),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: text,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Type Something',
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  sendMessage(text.text);
                  text.clear();
                },
                icon: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
