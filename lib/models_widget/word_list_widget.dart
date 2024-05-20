import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'background_widget.dart';

class WordListWidget extends StatefulWidget {
  const WordListWidget({super.key, required this.WordList, required this.renk,});
  final List <String> WordList;
  final Color renk;

  @override
  State<WordListWidget> createState() => _WordListWidgetState();
}

class _WordListWidgetState extends State<WordListWidget> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      MainWidget: Column(
        children: [
          Container(
            color: Colors.transparent,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 32),
                child: Text(
                  "Kelime sayısı: ${widget.WordList.length}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              itemCount: widget.WordList.length,
              itemBuilder: (context, index) => _buildButton(context, widget.WordList[index]),

            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: OutlinedButton(
        onPressed: () {
          _showAlertDialog(context, text);
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: widget.renk,
          side: const BorderSide(color: Colors.black),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(fontSize: 18,),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FutureBuilder(
          future: _fetchTranslation(text),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                title: Text(text, textAlign: TextAlign.center),
                content: const Center(child: CircularProgressIndicator()),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Kapat'),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                title: const Text('Hata', textAlign: TextAlign.center),
                content: Text('Çeviri yüklenemedi: ${snapshot.error}'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Kapat'),
                  ),
                ],
              );
            } else {
              final translation = snapshot.data as String;
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                title: Text(text, textAlign: TextAlign.center),
                content: Text(translation),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Kapat'),
                  ),
                ],
              );
            }
          },
        );
      },
    );
  }

  Future<String> _fetchTranslation(String text) async {
    final gemini = Gemini.instance;

    try {
      // prompt
      final response = await gemini.text("$text kelimesinin Türkçe anlamını ve geçtiği ingilizce bir cümleyi Türkçe anlamıyla birlikte yaz");
      if (response != null && response.output != null) {
        return response.output!;
      } else {
        throw Exception('Çeviri bulunamadı');
      }
    } catch (e) {
      throw Exception('Çeviri yüklenemedi: $e');
    }
  }
}