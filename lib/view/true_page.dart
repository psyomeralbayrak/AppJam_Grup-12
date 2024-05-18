import 'package:appjamoua/models_widget/word_list_widget.dart';
import 'package:flutter/material.dart';

class TruePage extends StatefulWidget {
  const TruePage({super.key});

  @override
  State<TruePage> createState() => _TruePageState();
}

class _TruePageState extends State<TruePage> {

  // Örnek doğru bilinen kelimeler listesi
  List<String> trueWords = [];

  @override
  void initState() {
    super.initState();
    // Oxford 3000'den gelen kelimeleri karşılayacak liste
    trueWords.addAll([
      'Kelime 1', 'Kelime 2', 'Kelime 3', 'Kelime 4',
      'Kelime 5', 'Kelime 6', 'Kelime 7', 'Kelime 8',
      'Kelime 9', 'Kelime 10', 'Kelime 11'
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Doğru Bildiğim Kelimeler"),
        centerTitle: true,
      ),

      body: WordListWidget(WordList: trueWords),);
}
}