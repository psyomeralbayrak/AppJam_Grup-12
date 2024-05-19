import 'package:flutter/material.dart';
import 'background_widget.dart';

class WordListWidget extends StatelessWidget {
  const WordListWidget({super.key, required this.WordList,});
  final List <String> WordList;

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      MainWidget: Column(
        children: [
          Container(
            color: Colors.transparent, // Saydam arka plan
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 32),
                child: Text(
                  "Kelime sayısı: ${WordList.length}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black), // Beyaz yazı rengi
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              itemCount: WordList.length,
              itemBuilder: (context, index) => _buildButton(context, WordList[index]),

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
          backgroundColor: Color.fromRGBO(181, 193, 142, 1),
          side: const BorderSide(color: Colors.black), // Beyaz kenar çizgisi
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(fontSize: 18,),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black), // Beyaz yazı rengi
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text, textAlign: TextAlign.center),
          content: Text("api den gelen cümle"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // AlertDialog'u kapat
              },
              child: Text('Kapat'),
            ),
          ],
        );
      },
    );
  }
}