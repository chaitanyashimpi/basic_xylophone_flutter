import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Color> _buttonColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Color(0xff000080),
    Colors.pink,
  ];

  void playSound(int noteIndex) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$noteIndex.wav'));
  }

  Widget buildButton(int noteIndex) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(noteIndex);
        },
        child: SizedBox.expand(
          child: Card(
            color: _buttonColors[noteIndex - 1],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('XyloPhone'),
          backgroundColor: Colors.black12,
        ),
        body: SafeArea(
          child: Column(
            children: [
              for (int i = 1; i <= _buttonColors.length; i++) buildButton(i),
            ],
          ),
        ),
      ),
    );
  }
}
