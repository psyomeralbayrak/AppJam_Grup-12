import 'package:appjamoua/models_widget/word_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MyWordPage extends StatefulWidget {
  const MyWordPage({super.key});

  @override
  State<MyWordPage> createState() => _MyWordPageState();
}

class _MyWordPageState extends State<MyWordPage> {

  // Örnek doğru bilinen kelimeler listesi
  List<String> MyWords = [];

  @override
  void initState() {
    super.initState();
    // Oxford 3000'den gelen kelimeleri karşılayacak liste
    MyWords.addAll([
      'Significant', 'Obstacle',
    ]);

    // Kendi kelimelerim datasini cagirdik.
    Hive.box("myBox");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Kelimelerim", style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 3),
            child: IconButton(onPressed: () {

            },
                icon: Icon(Icons.add)),
          )
        ],
      ),

      body: WordListWidget(WordList: MyWords, renk: Color.fromRGBO(247,228,206,1),),);
  }
}