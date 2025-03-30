class ArticleModel {
  List<Records>? records;
  int? total;
  int? size;
  int? current;
  int? pages;

  ArticleModel({this.records, this.total, this.size, this.current, this.pages});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      records = <Records>[];
      json['records'].forEach((v) {
        records!.add(Records.fromJson(v));
      });
    }
    total = json['total'];
    size = json['size'];
    current = json['current'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (records != null) {
      data['records'] = records!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['size'] = size;
    data['current'] = current;
    data['pages'] = pages;
    return data;
  }
}

class Records {
  String? id;
  String? cid;
  String? title;
  String? intro;
  String? summary;
  String? image;
  String? content;
  String? author;
  int? visit;
  int? sort;
  String? createBy;
  String? createTime;
  String? updateBy;
  String? updateTime;
  String? delFlag;
  bool? collect;
  String? cname;

  Records(
      {this.id,
      this.cid,
      this.title,
      this.intro,
      this.summary,
      this.image,
      this.content,
      this.author,
      this.visit,
      this.sort,
      this.createBy,
      this.createTime,
      this.updateBy,
      this.updateTime,
      this.delFlag,
      this.collect,
      this.cname});

  Records.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cid = json['cid'];
    title = json['title'];
    intro = json['intro'];
    summary = json['summary'];
    image = json['image'];
    content = json['content'];
    author = json['author'];
    visit = json['visit'];
    sort = json['sort'];
    createBy = json['createBy'];
    createTime = json['createTime'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    delFlag = json['delFlag'];
    collect = json['collect'];
    cname = json['cname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cid'] = cid;
    data['title'] = title;
    data['intro'] = intro;
    data['summary'] = summary;
    data['image'] = image;
    data['content'] = content;
    data['author'] = author;
    data['visit'] = visit;
    data['sort'] = sort;
    data['createBy'] = createBy;
    data['createTime'] = createTime;
    data['updateBy'] = updateBy;
    data['updateTime'] = updateTime;
    data['delFlag'] = delFlag;
    data['collect'] = collect;
    data['cname'] = cname;
    return data;
  }
}
