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
    {
      this.id,
      this.tagID,
      this.keyword,
      this.detail,
      this.date,
      this.location,
      this.alarm,
      this.link_1,
      this.link_2,
      this.link_3
    }
    );
  Feed.cons(tagID,keyword,detail){
    this.tagID = tagID;
    this.keyword = keyword;
    this.detail = detail;
  }



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

  //생성자 Q.중괄호는 왜 있는거지?
  Tag({
    this.tagID,
    this.content
  });

  //fromJson메서드
  Tag.fromJson(Map<String, dynamic> json){
    tagID = json['tagID'];
    content = json['content'];
  }

  //toJson메써드
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tagID'] = this.tagID;
    data['content'] = this.content;
    return data;
  }
}

//테스트 클래스
class Todo{
  int? userId;
  int? id;
  String? title;
  bool? completed;

  //생성자 Q.중괄호는 왜 있는거지?
  Todo({
    this.userId,
    this.id,
    this.title,
    this.completed
  });

  //fromJson메서드
  Todo.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  //toJson메써드
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;

    return data;
  }
}

