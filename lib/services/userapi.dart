//@dart=2.9
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;



/*
class UserApi{
  String baseUrl = "http://10.0.2.2:8000/api/user";
  Future<List<user>> getAllUsers()async{

    var response = await http.get(Uri.parse(baseUrl));
    users Users = users.fromJson({"userList":[{"id":1,"type":null,"name":"ahmed","email":"a@a.com","mobile":null,"profile":null,"email_verified_at":null,"created_at":"2022-04-09T20:14:41.000000Z","updated_at":"2022-04-09T20:14:41.000000Z"},{"id":2,"type":null,"name":"Lotfy","email":"Lotfy@Lotfy.com","mobile":null,"profile":null,"email_verified_at":null,"created_at":"2022-04-01T17:44:26.000000Z","updated_at":"2022-04-20T17:44:26.000000Z"}]});
//     if(response.statusCode ==200){
//       String data = response.body;
//     var jsonData =jsonDecode(data);
//       // user users = user.fromJson(jsonData);
//       users userss = users.fromJson(jsonData);
List<user> ulist = users().userList.map((e) => user.fromJson(e)).toList();
    return  ulist;
//     }
//     else
//       return  Future.error("server Error");




  }
}*/


// class Network{
//   final String _url = 'http://10.0.2.2:8000/api/';
//   //if you are using android studio emulator, change localhost to 10.0.2.2
//   var token;
//
//   _getToken() async {
//     SharedPreferences localStorage = await SharedPreferences.getInstance();
//     token = jsonDecode(localStorage.getString('token')!)['token'];
//   }
//
//   authData(data, apiUrl) async {
//     var fullUrl = _url + apiUrl;
//     return await http.post(
//         Uri.parse(fullUrl),
//         body: jsonEncode(data),
//         headers: _setHeaders()
//     );
//   }
//
//   getData(apiUrl) async {
//     var fullUrl = _url + apiUrl;
//     await _getToken();
//     return await http.get(
//         Uri.parse(fullUrl),
//         headers: _setHeaders()
//     );
//   }
//
//   _setHeaders() => {
//     'Content-type' : 'application/json',
//     'Accept' : 'application/json',
//     'Authorization' : 'Bearer $token'
//   };
//
// }

 class connectApi{
    static Dio dio;

 static init(){
     dio = Dio(
     BaseOptions(
         baseUrl: "http://10.0.2.2:8000/api/",
         receiveDataWhenStatusError: true,
         headers: {
           'Content-Type':'application/json',
           'Accept':'application/json'
         },
         followRedirects: false,
         validateStatus: (status) { return status < 500;}
     ),
   );
 }

   Future<Response> getData({
     @required String url,
     @required  Map<String,dynamic>query,
     String token,

   }) async{
return await dio.get(url,queryParameters: query,
options: Options(
  headers: {
    'Authorization': 'Bearer $token'
  }
)

);
   }

   Future<Response> postData({
     @required String url,
     Map<String,dynamic>query,
     String token,
       Map<String,dynamic>data,
   }) async{
     return  dio.post(url,
     queryParameters: query,
     data: data,

     options: Options(
         headers: {
         'Authorization': 'Bearer $token'
         }

     ));
   }

}


//End Points

const LOGIN = 'login';
const LOGOUT = 'logout';
const REGISTER = 'register';
const USER = 'user';
const CITY  = 'cities';
const RESTAURANTS  = 'restaurants';
const WISHLIST  = 'wishlists';
const POSTS  = 'posts';

