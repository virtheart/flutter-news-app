class ArticleCategoryModel {
  String? id;
  String? name;
  int? sort;
  int? isShow;
  String? createBy;
  String? createTime;
  String? updateBy;
  String? updateTime;
  String? delFlag;

  ArticleCategoryModel(
      {this.id,
      this.name,
      this.sort,
      this.isShow,
      this.createBy,
      this.createTime,
      this.updateBy,
      this.updateTime,
      this.delFlag});

  ArticleCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sort = json['sort'];
    isShow = json['isShow'];
    createBy = json['createBy'];
    createTime = json['createTime'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    delFlag = json['delFlag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sort'] = this.sort;
    data['isShow'] = this.isShow;
    data['createBy'] = this.createBy;
    data['createTime'] = this.createTime;
    data['updateBy'] = this.updateBy;
    data['updateTime'] = this.updateTime;
    data['delFlag'] = this.delFlag;
    return data;
  }
}
