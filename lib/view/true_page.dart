import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:appjamoua/models_widget/word_list_widget.dart';

class TruePage extends StatefulWidget {
  const TruePage({super.key});

  @override
  State<TruePage> createState() => _TruePageState();
}

class _TruePageState extends State<TruePage> {
  List<String> trueWords = [];

  @override
  void initState() {
    super.initState();
    var trueBox = Hive.box("trueBox");
    trueWords = trueBox.get('trueList', defaultValue: <String>[])?.cast<String>() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Doğru Bildiğim Kelimeler",  style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: WordListWidget(WordList: trueWords, renk: Color.fromRGBO(198,245,222,1),),
    );
  }
}