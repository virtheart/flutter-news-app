class AuthModel {
  String? sub;
  String? iss;
  bool? active;
  String? tokenType;
  String? clientId;
  String? accessToken;
  String? refreshToken;
  List<String>? aud;
  String? license;
  double? nbf;
  String? userId;
  List<String>? scope;
  double? exp;
  int? expiresIn;
  double? iat;
  String? jti;
  String? username;

  AuthModel(
      {this.sub,
      this.iss,
      this.active,
      this.tokenType,
      this.clientId,
      this.accessToken,
      this.refreshToken,
      this.aud,
      this.license,
      this.nbf,
      this.userId,
      this.scope,
      this.exp,
      this.expiresIn,
      this.iat,
      this.jti,
      this.username});

  AuthModel.fromJson(Map<String, dynamic> json) {
    sub = json['sub'];
    iss = json['iss'];
    active = json['active'];
    tokenType = json['token_type'];
    clientId = json['client_id'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    aud = json['aud'].cast<String>();
    license = json['license'];
    nbf = json['nbf'];
    userId = json['user_id'];
    scope = json['scope'].cast<String>();
    exp = json['exp'];
    expiresIn = json['expires_in'];
    iat = json['iat'];
    jti = json['jti'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub'] = this.sub;
    data['iss'] = this.iss;
    data['active'] = this.active;
    data['token_type'] = this.tokenType;
    data['client_id'] = this.clientId;
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    data['aud'] = this.aud;
    data['license'] = this.license;
    data['nbf'] = this.nbf;
    data['user_id'] = this.userId;
    data['scope'] = this.scope;
    data['exp'] = this.exp;
    data['expires_in'] = this.expiresIn;
    data['iat'] = this.iat;
    data['jti'] = this.jti;
    data['username'] = this.username;
    return data;
  }
}
