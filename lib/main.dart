import 'package:flutter/material.dart';
import 'package:openai_chat_gpt_flutter/models/models_provider.dart';
import 'package:openai_chat_gpt_flutter/screens/chatbot_ui.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MentalHealthApp());
}

class MentalHealthApp extends StatelessWidget {
  const MentalHealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_) => ModelsProvider())
      ],
      child: MaterialApp(
        title: 'Mental Health Support App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Roboto', // Use a legible font
        ),
        routes: {

          '/chat': (context) => ChatBotWidget(),
        },
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mental Health Support'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome to the Mental Health Support App',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Get the support you need in a safe and caring environment.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatBotWidget(),
                    ));
              },
              child: const Text('Start a Conversation'),
            ),
          ],
        ),
      ),
    );
  }
}
