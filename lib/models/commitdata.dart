class CommitData {
  final String sha;
  final String nodeid;
  final String name;

  CommitData({
    this.nodeid,
    this.sha,
    this.name,
  });

  factory CommitData.fromJson(Map<String, dynamic> json) {
    return CommitData(
      nodeid: json['node_id'].toString(),
      sha: json['sha'].toString(),
      name: json['commit']['author']['name'].toString(),
    );
  }
}
