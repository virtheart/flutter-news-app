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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub'] = sub;
    data['iss'] = iss;
    data['active'] = active;
    data['token_type'] = tokenType;
    data['client_id'] = clientId;
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    data['aud'] = aud;
    data['license'] = license;
    data['nbf'] = nbf;
    data['user_id'] = userId;
    data['scope'] = scope;
    data['exp'] = exp;
    data['expires_in'] = expiresIn;
    data['iat'] = iat;
    data['jti'] = jti;
    data['username'] = username;
    return data;
  }
}
