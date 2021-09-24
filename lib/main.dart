import 'dart:async';

import 'package:flutter/material.dart';

import 'models/commitdata.dart';
import 'providers/fetchdata.dart';
import 'utils/commitbuild.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<CommitData>> futureCommitData;

  @override
  void initState() {
    super.initState();
    futureCommitData = fetchCommitData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GitHub Flutter Commits',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('GitHub Flutter Commits'),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: commitBuilder(futureCommitData: futureCommitData),
        ),
      ),
    );
  }
}
