import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:appjamoua/models_widget/word_list_widget.dart';

class FalsePage extends StatefulWidget {
  const FalsePage({super.key});

  @override
  State<FalsePage> createState() => _FalsePageState();
}

class _FalsePageState extends State<FalsePage> {
  List<String> falseWords = [];

  @override
  void initState() {
    super.initState();
    var falseBox = Hive.box("falseBox");
    falseWords = falseBox.get('falseList', defaultValue: <String>[])?.cast<String>() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Bilemediğim Kelimeler",  style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: WordListWidget(WordList: falseWords, renk: Color.fromRGBO(248,218,220,1),),
    );
  }
}