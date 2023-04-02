class Album{
  final int? id;
  final int? album;
  final String? tittle;
  final String? Url;
  final String? thumbnail;
  Album({
    this.id,
    this.album,
    this.tittle,
    this.Url,
    this.thumbnail, required title,
  });
  //this is factory  album that create album from json
  factory Album.fromJson(Map<String, dynamic> map) {
    return Album(
      id: map['id'],
      title: map['title'],
      album:map["album"],
      Url:map["Url"],
      thumbnail:map["thumbnail"],

    );
  }
}

