class ResponseLog{
final String token;
final String error;

ResponseLog({required this.token,required this.error});
factory ResponseLog.fromJSon(Map<String,dynamic> json){
return ResponseLog(token: json['token'] ?? "",error: json['error'] ?? "");
}
}

class RequestLog{
late String email;
late String password;
RequestLog({required this.email,required this.password});

Map<String,dynamic> toJson(){
  Map<String,dynamic> map={
    'email':email.trim(),
    'password':password.trim()
  };
  return map;
}
}
