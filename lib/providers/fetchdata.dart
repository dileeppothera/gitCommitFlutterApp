import 'package:gitrep/models/commitdata.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<CommitData>> fetchCommitData() async {
  final response = await http
      .get(Uri.parse('https://api.github.com/repos/flutter/flutter/commits'));

  if (response.statusCode == 200) {
    var responseJson = jsonDecode(response.body);
    return (responseJson as List).map((p) => CommitData.fromJson(p)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load CommitData');
  }
}
