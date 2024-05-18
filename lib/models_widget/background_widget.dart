import 'package:flutter/material.dart';

class BackgroundWidget extends StatefulWidget {
  const BackgroundWidget({super.key, required this.MainWidget});
  final Widget MainWidget;

  @override
  State<BackgroundWidget> createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
        colors: [Color.fromARGB(242, 241, 241, 241 ), Color.fromARGB(230, 199, 183, 163)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        ),
        child: widget.MainWidget);
  }
}
