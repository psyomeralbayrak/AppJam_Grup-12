import 'package:appjamoua/models_widget/background_widget.dart';
import 'package:appjamoua/models_widget/quiz_widget.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Oxford 3000"),
        centerTitle: true,
      ),

      body: BackgroundWidget(
          
          MainWidget: QuizWidget()

      ),
    );
  }
}