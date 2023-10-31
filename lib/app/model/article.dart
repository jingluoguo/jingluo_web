class Article {
  int? id;
  String? name;
  String? link;
  String? img;
  String? tag;
  String? author;
  String? short;
  String? date;

  Article(
      {this.id,
        this.name,
        this.link,
        this.img,
        this.tag,
        this.author,
        this.short,
        this.date});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
    img = json['img'];
    tag = json['tag'];
    author = json['author'];
    short = json['short'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['link'] = this.link;
    data['img'] = this.img;
    data['tag'] = this.tag;
    data['author'] = this.author;
    data['short'] = this.short;
    data['date'] = this.date;
    return data;
  }
}