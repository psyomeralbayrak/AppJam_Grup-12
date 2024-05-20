import 'package:appjamoua/models_widget/background_widget.dart';
import 'package:appjamoua/view/false_page.dart';
import 'package:appjamoua/view/myword_page.dart';
import 'package:appjamoua/view/test_page.dart';
import 'package:appjamoua/view/true_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model/gemini_client.dart';

void main() async {

  //Initialize Hive
  await Hive.initFlutter();

  // Init the dict. - Buradakiler 3 databaseimizin cagrilmasi.
  await Hive.openBox('trueBox');
  await Hive.openBox('falseBox');
  await Hive.openBox('myBox');
  await Hive.openBox<int>('progressBox');

  // Asagida yoksa ekledim. Dilerseniz silebilirsiniz.
  var trueBox = Hive.box("trueBox");
  if (trueBox.isEmpty == true) {
    trueBox.put("true", []);
    print("True'ya eklendi");
  }
  //trueBox.putAt(0, []);
  //print(trueBox.getAt(0));

  var falseBox = Hive.box("falseBox");
  if (falseBox.isEmpty == true) {
    falseBox.put("false", []);
    print("False'a eklendi");
  }

  var myBox = Hive.box("myBox");
  if (myBox.isEmpty == true) {
    myBox.put("my", []);
    print("Mywords'e eklendi");
  }

  //init Gemini
  Gemini.init(apiKey: geminiApiKey);

  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/testpage': (context) => const TestPage(),
        '/truepage': (context) => const TruePage(),
        '/falsepage': (context) => const FalsePage(),
        '/mywordspage': (context) => const MyWordPage(),
      },

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(199, 183, 163,2),
          primary: Color.fromRGBO(208, 191, 254, 1.0),
        ),
        fontFamily: "Open Sans",
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final List<String> entries = <String>['Oxford 3000', 'Doğru Bilinenler', 'Yanlış Bilinenler', 'Kelimelerim'];
final List<int> colorCodes = <int>[200, 300, 400, 500];
final List<String> NavigationNames = ["/testpage","/truepage","/falsepage","/mywordspage"];

class _MyHomePageState extends State<MyHomePage> {
  List renk = [
    [229,221,252], [198,245,222], [248,218,220], [247,228,206],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text("WordMaster", style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 3),
            child: IconButton(onPressed: () {

            },
                icon: Icon(Icons.search)),
          )
        ],
      ),

      body: BackgroundWidget(
        MainWidget: ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(NavigationNames[index]);
              },
              child: Padding(
                padding: EdgeInsets.only(top: 35),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), color: Color.fromRGBO(renk[index][0], renk[index][1], renk[index][2], 1),),
                  //Colors.lightGreen[colorCodes[index]]
                  height: 120,
                  child: Center(child: Text('${entries[index]}',style: TextStyle(fontSize: 35),)),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Text(""),
        ),
      ),


    );
  }
}
