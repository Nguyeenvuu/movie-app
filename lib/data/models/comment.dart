class Comment {
  int _userId;
  int _movieId;
  String _content;
  DateTime _timeStamp;

  int get userId => this._userId;
  int get movieId => this._movieId;
  String get content => this._content;
  DateTime get timeStamp => this._timeStamp;

  Comment(this._userId, this._movieId, this._content, this._timeStamp);
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      json['user'],
      json['movie'],
      json['content'],
      json['timestamp'],
    );
  }
  @override
  String toString() {
    return '''
  user_id: $_userId,
  movie_id: $_movieId,
  content: $_content
  ''';
  }
}
