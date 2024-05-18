import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
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
                  'Buraya soru gelecek',
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
                child: Text('Answer 1'),
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
                child: Text('Answer 2'),
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
                child: Text('Answer 3'),
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
                child: Text('Answer 4'),
              ),
            ),
          ],
        ),
      );

  }
}
