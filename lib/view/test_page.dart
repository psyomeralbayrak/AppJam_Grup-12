import 'package:appjamoua/models_widget/background_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../model/dictionary_model.dart';
import 'package:hive/hive.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late Box trueBox;
  late Box falseBox;
  late Box<int> progressBox;

  @override
  void initState() {
    super.initState();
    trueBox = Hive.box('trueBox');
    falseBox = Hive.box('falseBox');
    progressBox = Hive.box<int>('progressBox');

    // Index list
    for (int i = 0; i < oxford3000.length; i++) {
      wordIndex.add(i);
    }
    // Shuffle the list
    wordIndex.shuffle();

    // Load the last saved progress
    CurrentIndex = progressBox.get('currentIndex', defaultValue: 0)!;

    createAnswer(wordIndex[CurrentIndex]);
    print(oxford3000.values.elementAt(wordIndex[CurrentIndex]));
  }

  // var for index
  int CurrentIndex = 0;
  // var for true or false
  int isTrue = 1;

  // Creating random index in every time
  List<int> wordIndex = [];

  // Answer indexes
  List<int> answerIndexs = [];

  // Function that creates answers
  void createAnswer(int trueAnswer) {
    print("Dogru olan: $trueAnswer");
    print("Dogru olan karsiligi: ${oxford3000.values.elementAt(trueAnswer)}");
    answerIndexs = [];
    answerIndexs.add(trueAnswer);

    // Call random funct
    Random random = Random();

    while (answerIndexs.length < 4) {
      int randomIndex = random.nextInt(oxford3000.length);
      if (randomIndex != trueAnswer) {
        answerIndexs.add(randomIndex);
      }
    }
    // buraya dikkat et
    print(answerIndexs);
    answerIndexs.shuffle();
    print(answerIndexs);
    print(answerIndexs[0]);
  }

  // Function that checks the response
  void checkResponse(int response) {
    if (wordIndex[CurrentIndex] == answerIndexs[response]) {
      if (mounted) {
        setState(() {
          print("Dogru bildin!");
          isTrue = 2;
          addToTrueBox(oxford3000.keys.elementAt(wordIndex[CurrentIndex]));
          addOne();
        });
      }
    } else {
      if (mounted) {
        setState(() {
          print("Yanlis bildin");
          isTrue = 3;
          addToFalseBox(oxford3000.keys.elementAt(wordIndex[CurrentIndex]));
          addOne();
        });
      }
    }
  }

  void addOne() async {
    await Future.delayed(const Duration(seconds: 1));

    if (mounted) {
      setState(() {
        CurrentIndex += 1;

        if (CurrentIndex >= wordIndex.length) {
          // All words completed, reset progress and clear boxes
          CurrentIndex = 0;
          trueBox.clear();
          falseBox.clear();
        }

        createAnswer(wordIndex[CurrentIndex]);
        isTrue = 1;

        // Save the current index to progress box
        progressBox.put('currentIndex', CurrentIndex);
      });
    }
  }

  void addToTrueBox(String word) {
    List<String> currentList = trueBox.get('trueList', defaultValue: <String>[])?.cast<String>() ?? [];
    if (!currentList.contains(word) && !isInFalseBox(word)) {
      currentList.add(word);
      trueBox.put('trueList', currentList);
    }
  }

  void addToFalseBox(String word) {
    List<String> currentList = falseBox.get('falseList', defaultValue: <String>[])?.cast<String>() ?? [];
    if (!currentList.contains(word) && !isInTrueBox(word)) {
      currentList.add(word);
      falseBox.put('falseList', currentList);
    }
  }

  bool isInTrueBox(String word) {
    List<String> currentList = trueBox.get('trueList', defaultValue: <String>[])?.cast<String>() ?? [];
    return currentList.contains(word);
  }

  bool isInFalseBox(String word) {
    List<String> currentList = falseBox.get('falseList', defaultValue: <String>[])?.cast<String>() ?? [];
    return currentList.contains(word);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Quiz', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: BackgroundWidget(
        MainWidget: Column(
          children: [

            if (isTrue == 2)
              const Text(
                'Doğru!',
                style: TextStyle(color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            if (isTrue == 3)
              const Text(
                'Yanlış!',
                style: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),
              ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 32),
              child: Text(
                "Soru ${CurrentIndex + 1} / ${wordIndex.length}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 32),
              child: Text(
                oxford3000.keys.elementAt(wordIndex[CurrentIndex]),
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                itemCount: 4,
                itemBuilder: (context, index) => _buildOption(context, index),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: OutlinedButton(
        onPressed: () {
          checkResponse(index);
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(229,221,252, 1),
          side: const BorderSide(color: Colors.black),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(fontSize: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: Text(
          oxford3000.values.elementAt(answerIndexs[index]),
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
