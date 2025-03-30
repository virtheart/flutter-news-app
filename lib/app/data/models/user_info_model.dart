class UserInfoModel {
  AppUser? appUser;
  List<String>? permissions;
  List<String>? roles;

  UserInfoModel({this.appUser, this.permissions, this.roles});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    appUser =
        json['appUser'] != null ? AppUser.fromJson(json['appUser']) : null;
    permissions = json['permissions'].cast<String>();
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (appUser != null) {
      data['appUser'] = appUser!.toJson();
    }
    data['permissions'] = permissions;
    data['roles'] = roles;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['username'] = username;
    data['password'] = password;
    data['createBy'] = createBy;
    data['updateBy'] = updateBy;
    data['createTime'] = createTime;
    data['updateTime'] = updateTime;
    data['delFlag'] = delFlag;
    data['lockFlag'] = lockFlag;
    data['passwordExpireFlag'] = passwordExpireFlag;
    data['passwordModifyTime'] = passwordModifyTime;
    data['phone'] = phone;
    data['avatar'] = avatar;
    data['deptId'] = deptId;
    data['tenantId'] = tenantId;
    data['wxOpenid'] = wxOpenid;
    data['wxCpUserid'] = wxCpUserid;
    data['wxDingUserid'] = wxDingUserid;
    data['miniOpenid'] = miniOpenid;
    data['qqOpenid'] = qqOpenid;
    data['giteeLogin'] = giteeLogin;
    data['oscId'] = oscId;
    data['nickname'] = nickname;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
