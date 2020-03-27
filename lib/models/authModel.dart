class Auth{
  final bool auth;
  final String accessToken;
  final String username;
  final  authorities;

  Auth(this.auth, this.accessToken, this.username, this.authorities);
  
  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth( 
      json['auth'],
      json['accessToken'],
      json['username'],
      json['authorities']
    );

  }

  

}