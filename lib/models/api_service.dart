import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_data/models/request.dart';
class ApiService{
  Future<ResponseLog> login(RequestLog request) async{
    String url="https://reqres.in/api/login";
    final response=await http.post(
        Uri.parse(url),
      body: request.toJson(),
    );
    if(response.statusCode==200){
      return ResponseLog.fromJSon(json.decode(response.body));
    }
    else{
      throw Exception("Failed to load Model");
    }
  }
}