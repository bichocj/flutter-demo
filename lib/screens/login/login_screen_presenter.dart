import 'package:http/http.dart' as http;

abstract class LoginScreenContract {
  void onLoginSuccess(String token);
  void onLoginError(String errorTxt);
}

class LoginScreenPresenter {
  LoginScreenContract _view;  
  LoginScreenPresenter(this._view);

  doLogin(String username, String password) {
    http
        .post(url, body: {"username": _login.username, "password": _login.password})
        .then((http.Response response) {
          print("Response status: ${response.statusCode}");
          print("Response body: ${response.body}");
        });


        print("Login with "+ _login.username);
        if(_login.username == 'user' && _login.password == 'pwd'){
          _setAuthenticated(true);
        }else{
          print("Usuario y contraseña incorrecto");
        }

    try{
    api.login(username, password).then((String token) {
        _view.onLoginSuccess(token);

    }).catchError((handleError) => 
      _view.onLoginError(handleError.message)
    );
    }catch(e){
      print(e.toString());  
    }
  }

}