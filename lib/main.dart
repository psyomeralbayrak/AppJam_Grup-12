import 'package:appjamoua/models_widget/background_widget.dart';
import 'package:appjamoua/view/false_page.dart';
import 'package:appjamoua/view/myword_page.dart';
import 'package:appjamoua/view/test_page.dart';
import 'package:appjamoua/view/true_page.dart';
import 'package:flutter/material.dart';

void main() {
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
          primary: Color.fromRGBO(199, 183, 163,1),

        ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("App Jam Group 12"),
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
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), color: Color.fromRGBO(181, 193, 142, 1),),
                //Colors.lightGreen[colorCodes[index]]
                height: 180,
                child: Center(child: Text('${entries[index]}',style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),)),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Text(""),
        ),
      ),


    );
  }
}
