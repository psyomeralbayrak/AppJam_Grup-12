import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  const QuizWidget({super.key, required this.Question, required this.Answer1, required this.Answer2, required this.Answer3, required this.Answer4, });
  final String Question;
  final String Answer1;
  final String Answer2;
  final String Answer3;
  final String Answer4;

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Sağ ve sol taraftan hizalama
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 335,
              height: 260,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5), // Beyaz arka plan rengi %50 saydamlıkla
                borderRadius: BorderRadius.circular(20.0), // Kenarları ovalleştirmek için
              ),
              child: Center(
                child: Text(
                  " '${widget.Question}' kelimesinin anlamı nedir?",
                  style: TextStyle(color: Colors.black), // Metin rengi siyah
                ),
              ),
            ),
            SizedBox(height: 50), // Metin ile ilk buton arasında 20 birimlik boşluk

            SizedBox(
              width: 335,
              height: 55, // Buton yüksekliği 55 piksel
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black, // Buton üzerindeki metin rengi siyah
                  shadowColor: Colors.black, // Gölgelendirme rengi siyah
                  elevation: 5, // Gölgelendirme miktarı
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Buton kenarlarını ovalleştirme
                  ),
                ),
                child: Text(widget.Answer1),
              ),
            ),
            SizedBox(height: 12),

            SizedBox(
              width: 335,
              height: 55, // Buton yüksekliği 55 piksel
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shadowColor: Colors.black,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(widget.Answer2),
              ),
            ),

            SizedBox(
              height: 12, //
            ),

            SizedBox(
              width: 335,
              height: 55, // Buton yüksekliği 55 piksel
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shadowColor: Colors.black,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(widget.Answer3),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            SizedBox(
              width: 335,
              height: 55, // Buton yüksekliği 55 piksel
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shadowColor: Colors.black,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(widget.Answer4),
              ),
            ),
          ],
        ),
      );

  }
}
