import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class LoginScreenContract {
  void onLoginSuccess(String token);
  void onLoginError(String errorTxt);
}

class LoginScreenPresenter {
  LoginScreenContract _view;  
  LoginScreenPresenter(this._view);

  doLogin(String username, String password) {
    String url = "https://flutter-demo-server.herokuapp.com/accounts/api/login/";

    http
        .post(url, body: {"username": username, "password": password})
        .then((http.Response response) {   
          final int statusCode = response.statusCode;
          final String res = response.body;

          if (statusCode < 200 || statusCode > 400) {
            throw new Exception("Error while fetching data");
          }

          final JsonDecoder _decoder = new JsonDecoder();
          dynamic _responseJson = _decoder.convert(res);

          if (_responseJson["non_field_errors"] != null) {            
            _view.onLoginError(_responseJson["non_field_errors"][0]);
          }else if(_responseJson["key"] != null){
            String token = _responseJson["key"];
            _view.onLoginSuccess(token);
          }
        });
  }
}