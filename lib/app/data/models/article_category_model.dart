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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['sort'] = sort;
    data['isShow'] = isShow;
    data['createBy'] = createBy;
    data['createTime'] = createTime;
    data['updateBy'] = updateBy;
    data['updateTime'] = updateTime;
    data['delFlag'] = delFlag;
    return data;
  }
}
