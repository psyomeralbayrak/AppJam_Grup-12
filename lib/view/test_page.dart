import 'package:appjamoua/models_widget/background_widget.dart';
import 'package:appjamoua/models_widget/quiz_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import '../model/dictionary_model.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});


  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Index list
    for (int i = 0; i < oxford3000.length; i++) {
      wordIndex.add(i);
    }
    // Shuffle the list
    wordIndex.shuffle();

    // createAnswer(3);
    // print(answerIndexs);


    createAnswer(wordIndex[CurrentIndex]);
    print(oxford3000.values.elementAt(wordIndex[CurrentIndex]));

  }

  final int CurrentIndex = 0;

  // Creating random index in every time
  List <int> wordIndex = [];

  // Answer indexs
  List<int> answerIndexs = [];


  // Function that create answers
  void createAnswer(int trueAnswer) {
    print("Dogru olan: ${trueAnswer}");
    print("Dogru olan karsiligi: ${oxford3000.values.elementAt(trueAnswer)}");
    answerIndexs = [];
    answerIndexs.add(trueAnswer);

    // Call random funct
    Random random = Random();

    while (answerIndexs.length<4) {
      int randomIndex = random.nextInt(oxford3000.length);
      if (randomIndex != trueAnswer) {
        answerIndexs.add(randomIndex);
      }
    }

    print(answerIndexs);
    answerIndexs.shuffle();
    print(answerIndexs);
    print(answerIndexs[0]);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Oxford 3000"),
        centerTitle: true,
      ),

      body: BackgroundWidget(

          MainWidget: QuizWidget(
            Question: oxford3000.keys.elementAt(wordIndex[CurrentIndex]),
            Answer1: oxford3000.values.elementAt(answerIndexs[0]),
            Answer2: oxford3000.values.elementAt(answerIndexs[1]),
            Answer3: oxford3000.values.elementAt(answerIndexs[2]),
            Answer4: oxford3000.values.elementAt(answerIndexs[3]),
          )

      ),
    );
  }
}