import 'package:appjamoua/models_widget/word_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FalsePage extends StatefulWidget {
  const FalsePage({super.key});

  @override
  State<FalsePage> createState() => _FalsePageState();
}

class _FalsePageState extends State<FalsePage> {

  // Örnek doğru bilinen kelimeler listesi
  List<String> falseWords = [];

  @override
  void initState() {
    super.initState();
    // Oxford 3000'den gelen kelimeleri karşılayacak liste
    falseWords.addAll([
      'Kelime 1', 'Kelime 2', 'Kelime 3', 'Kelime 4',
      'Kelime 5', 'Kelime 6', 'Kelime 7', 'Kelime 8',
      'Kelime 9',
    ]);

    // Yanlis datayi cagirdik.
    var falseBox = Hive.box("falseBox");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Bilemediğim Kelimeler"),
        centerTitle: true,
      ),

      body: WordListWidget(WordList: falseWords),);
  }
}