class UserInfoModel {
  AppUser? appUser;
  List<String>? permissions;
  List<String>? roles;

  UserInfoModel({this.appUser, this.permissions, this.roles});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    appUser =
        json['appUser'] != null ? new AppUser.fromJson(json['appUser']) : null;
    permissions = json['permissions'].cast<String>();
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.appUser != null) {
      data['appUser'] = this.appUser!.toJson();
    }
    data['permissions'] = this.permissions;
    data['roles'] = this.roles;
    return data;
  }
}

class AppUser {
  String? userId;
  String? username;
  String? password;
  String? createBy;
  String? updateBy;
  String? createTime;
  String? updateTime;
  String? delFlag;
  String? lockFlag;
  String? passwordExpireFlag;
  String? passwordModifyTime;
  String? phone;
  String? avatar;
  String? deptId;
  String? tenantId;
  String? wxOpenid;
  String? wxCpUserid;
  String? wxDingUserid;
  String? miniOpenid;
  String? qqOpenid;
  String? giteeLogin;
  String? oscId;
  String? nickname;
  String? name;
  String? email;

  AppUser(
      {this.userId,
      this.username,
      this.password,
      this.createBy,
      this.updateBy,
      this.createTime,
      this.updateTime,
      this.delFlag,
      this.lockFlag,
      this.passwordExpireFlag,
      this.passwordModifyTime,
      this.phone,
      this.avatar,
      this.deptId,
      this.tenantId,
      this.wxOpenid,
      this.wxCpUserid,
      this.wxDingUserid,
      this.miniOpenid,
      this.qqOpenid,
      this.giteeLogin,
      this.oscId,
      this.nickname,
      this.name,
      this.email});

  AppUser.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    password = json['password'];
    createBy = json['createBy'];
    updateBy = json['updateBy'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    delFlag = json['delFlag'];
    lockFlag = json['lockFlag'];
    passwordExpireFlag = json['passwordExpireFlag'];
    passwordModifyTime = json['passwordModifyTime'];
    phone = json['phone'];
    avatar = json['avatar'];
    deptId = json['deptId'];
    tenantId = json['tenantId'];
    wxOpenid = json['wxOpenid'];
    wxCpUserid = json['wxCpUserid'];
    wxDingUserid = json['wxDingUserid'];
    miniOpenid = json['miniOpenid'];
    qqOpenid = json['qqOpenid'];
    giteeLogin = json['giteeLogin'];
    oscId = json['oscId'];
    nickname = json['nickname'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['username'] = this.username;
    data['password'] = this.password;
    data['createBy'] = this.createBy;
    data['updateBy'] = this.updateBy;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    data['delFlag'] = this.delFlag;
    data['lockFlag'] = this.lockFlag;
    data['passwordExpireFlag'] = this.passwordExpireFlag;
    data['passwordModifyTime'] = this.passwordModifyTime;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['deptId'] = this.deptId;
    data['tenantId'] = this.tenantId;
    data['wxOpenid'] = this.wxOpenid;
    data['wxCpUserid'] = this.wxCpUserid;
    data['wxDingUserid'] = this.wxDingUserid;
    data['miniOpenid'] = this.miniOpenid;
    data['qqOpenid'] = this.qqOpenid;
    data['giteeLogin'] = this.giteeLogin;
    data['oscId'] = this.oscId;
    data['nickname'] = this.nickname;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
