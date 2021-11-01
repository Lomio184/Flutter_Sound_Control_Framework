import 'dart:async';
import 'dart:io';
// ignore: import_of_legacy_library_into_null_safe
import 'package:audioplayers/audioplayers.dart';
import 'package:equalizer/equalizer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'customEq.dart';

typedef OnError = void Function(Exception exception);

const kUrl1 = 'audio/audio.mp3';

void main() {
  runApp(const MaterialApp(home: App()));
}

class App extends StatefulWidget {
  const App({
    Key ? key
  }): super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State < App > {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AudioManager",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}