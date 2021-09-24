import 'package:flutter/material.dart';
import 'package:gitrep/models/commitdata.dart';

class commitBuilder extends StatelessWidget {
  const commitBuilder({
    Key key,
    @required this.futureCommitData,
  }) : super(key: key);

  final Future<List<CommitData>> futureCommitData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CommitData>>(
      future: futureCommitData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: 25,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: (snapshot.data[i].sha.endsWith(
                            1.toString(),
                          )) ||
                          (snapshot.data[i].sha.endsWith(
                            2.toString(),
                          )) ||
                          (snapshot.data[i].sha.endsWith(
                            3.toString(),
                          )) ||
                          (snapshot.data[i].sha.endsWith(
                            4.toString(),
                          )) ||
                          (snapshot.data[i].sha.endsWith(
                            5.toString(),
                          )) ||
                          (snapshot.data[i].sha.endsWith(
                            6.toString(),
                          )) ||
                          (snapshot.data[i].sha.endsWith(
                            7.toString(),
                          )) ||
                          (snapshot.data[i].sha.endsWith(
                            8.toString(),
                          )) ||
                          (snapshot.data[i].sha.endsWith(
                            9.toString(),
                          )) ||
                          (snapshot.data[i].sha.endsWith(
                            0.toString(),
                          ))
                      ? Colors.yellow
                      : Colors.transparent,
                  leading: Text(
                    (i + 1).toString(),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          snapshot.data[i].name +
                              "\nSha : " +
                              snapshot.data[i].sha,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
