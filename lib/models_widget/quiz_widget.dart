import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  QuizWidget({super.key, required this.Question, required this.Answer1, required this.Answer2, required this.Answer3, required this.Answer4, required this.Function1, required this.Function2, required this.Function3, required this.Function4, });
  final String Question;
  final String Answer1;
  final String Answer2;
  final String Answer3;
  final String Answer4;
  final VoidCallback Function1;
  final VoidCallback Function2;
  final VoidCallback Function3;
  final VoidCallback Function4;

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
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold,), // Metin rengi siyah
              ),
            ),
          ),
          SizedBox(height: 20), // Metin ile ilk buton arasında 20 birimlik boşluk

          SizedBox(
            width: 335,
            height: 55, // Buton yüksekliği 55 piksel
            child: ElevatedButton(
              onPressed: () => widget.Function1(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black, // Buton üzerindeki metin rengi siyah
                shadowColor: Colors.black, // Gölgelendirme rengi siyah
                elevation: 5, // Gölgelendirme miktarı
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Buton kenarlarını ovalleştirme
                ),
              ),
              child: Text(widget.Answer1, style: TextStyle(fontSize: 18),),
            ),
          ),
          SizedBox(height: 12),

          SizedBox(
            width: 335,
            height: 55, // Buton yüksekliği 55 piksel
            child: ElevatedButton(
              onPressed: () => widget.Function2(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shadowColor: Colors.black,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(widget.Answer2, style: TextStyle(fontSize: 18),),
            ),
          ),

          SizedBox(
            height: 12, //
          ),

          SizedBox(
            width: 335,
            height: 55, // Buton yüksekliği 55 piksel
            child: ElevatedButton(
              onPressed: () => widget.Function3(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shadowColor: Colors.black,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(widget.Answer3, style: TextStyle(fontSize: 18),),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            width: 335,
            height: 55, // Buton yüksekliği 55 piksel
            child: ElevatedButton(
              onPressed: () => widget.Function4(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shadowColor: Colors.black,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(widget.Answer4, style: TextStyle(fontSize: 18),),
            ),
          ),
        ],
      ),
    );

  }
}