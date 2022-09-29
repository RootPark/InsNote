class Feed {
  int? id;
  int? tagID;
  String? keyword;
  String? detail;
  String? date;
  String? location;
  int? alarm;
  String? link_1;
  String? link_2;
  String? link_3;
  Feed(
    {this.id,
      this.tagID,
      this.keyword,
      this.detail,
      this.date,
      this.location,
      this.alarm,
      this.link_1,
      this.link_2,
      this.link_3});
  Feed.fromJson(Map<String, dynamic> json){
    id = json['id'];
    tagID = json['tagID'];
    keyword = json['keyword'];
    detail = json['detail'];
    date = json['date'];
    location = json['location'];
    alarm = json['alarm'];
    link_1 = json['link_1'];
    link_2 = json['link_2'];
    link_3 = json['link_3'];
  }
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tagID'] = this.tagID;
    data['keyword'] = this.keyword;
    data['detail'] = this.detail;
    data['date'] = this.date;
    data['location'] = this.location;
    data['alarm'] = this.alarm;
    data['link_1'] = this.link_1;
    data['link_2'] = this.link_2;
    data['link_3'] = this.link_3;

    return data;
  }
}

class Tag{
  int? tagID;
  String? content;
  Tag({
    this.tagID,
    this.content
  });
  Tag.fromJson(Map<String, dynamic> json){
    tagID = json['tagID'];
    content = json['content'];
  }
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tagID'] = this.tagID;
    data['content'] = this.content;
    return data;
  }
}

