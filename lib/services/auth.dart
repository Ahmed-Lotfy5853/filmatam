import 'package:dio/dio.dart' as dio;

import 'package:flutter/cupertino.dart';

class Auth extends ChangeNotifier{
  bool _isloggedIn = false;
  bool get authenticated =>_isloggedIn;
  late String _token;
  Future<void>  login({Map? creds}) async {
    print(creds);
    try{
      dio.Response response = await dio.Dio().post('http://10.0.2.2:8000/api/sanctum/token',data: creds);
      print(response.data.toString());
      this._token =response.data.toString();
      _isloggedIn = true;
      notifyListeners();
    }catch(e){
      print(e);
    }
  }
  Future<void> tryToken({
  String? token,
}) async {
if(_token == null)return;
else{
  try{
    dio.Response response = await dio.Dio().get('http://10.0.2.2:8000/api/user',options: dio.Options(
      headers: {
        'Authorization':'Bearer $token'
      }
    ));

    this._isloggedIn = true;
    notifyListeners();

  }catch(e){
    print(e);
  }
}
  }
  void  logout(){
    _isloggedIn = false;
    notifyListeners();

  }

}