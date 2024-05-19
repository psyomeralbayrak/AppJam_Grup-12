import 'dart:io';

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

  // var for index
  int CurrentIndex = 0;
  // var for true or false
  int isTrue = 1;

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

  //Function that check the response
  void checkResponse (int response) {
    if (wordIndex[CurrentIndex] == answerIndexs[response]) {
      setState(() {
        print("Dogru bildin!");
        isTrue = 2;
        addOne();
      });
    }
    else {
      setState(() {
        print("Yanlis bildin");
        isTrue = 3;
        addOne();
      });

    }
  }

  void addOne () async{
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      CurrentIndex += 1;
      createAnswer(wordIndex[CurrentIndex]);
      isTrue = 1;
    });
  }

  List<Widget> mywidgets = [
    Center(
      child: Padding(child: Text(
          '',
      ), padding: EdgeInsets.only(top: 10),),
    ),
    Center(
      child: Padding(child: Text(
          'Doğru!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
      ), padding: EdgeInsets.only(top: 10),),
    ),
    Center(
      child: Padding(child: Text(
          'Yanlış!' , style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red)
      ), padding: EdgeInsets.only(top: 10),),
    ),
  ];

  Widget ResponseWidget() {
    if (isTrue == 1) {
      return mywidgets[0];
    }
    else if (isTrue == 2) {
      return mywidgets[1];
    }
    else {
      return mywidgets[2];
    }

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

          MainWidget: Column(
            children: [

              ResponseWidget(),

              QuizWidget(
                Question: oxford3000.keys.elementAt(wordIndex[CurrentIndex]),
                Answer1: oxford3000.values.elementAt(answerIndexs[0]),
                Answer2: oxford3000.values.elementAt(answerIndexs[1]),
                Answer3: oxford3000.values.elementAt(answerIndexs[2]),
                Answer4: oxford3000.values.elementAt(answerIndexs[3]),
                Function1: () {
                  checkResponse(0);
                },
                Function2: () {
                  checkResponse(1);
                },
                Function3: () {
                  checkResponse(2);
                },
                Function4: () {
                  checkResponse(3);
                },
              ),


            ]
          )

      ),
    );
  }
}