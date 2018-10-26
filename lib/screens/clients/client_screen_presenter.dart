import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

abstract class ClientScreenContract {
  void onClientSuccess(dynamic clients);
  void onClientError(String errorTxt);
}

class ClientScreenPresenter {
  ClientScreenContract _view;  
  ClientScreenPresenter(this._view);

  dynamic getData(url, params, token)  async  {
    var  httpClient  =  new  HttpClient();
    
    var  uri  =  new Uri.https("flutter-demo-server.herokuapp.com",  url, params);
    var  request  =  await httpClient.getUrl(uri);    
    request.headers.add('Authorization', 'token $token');

    var  response  =  await request.close();
    var  responseBody  =  await response.transform(utf8.decoder).join();
    return  responseBody;
}

  requestClients() async {
    var url  =  "/clients/api/clients/";
    Map<String, String> queryParameters = Map<String, String>();

    return getData(url, queryParameters, "71e3648aac89440dfc19a4dd550231ce597951c1").then((dynamic rr){
      final JsonDecoder _decoder = new JsonDecoder();
      final dynamic res =  _decoder.convert(rr);
      _view.onClientSuccess(res);
    });
    

/*
    return http.get(url, headers: {'Authorization': "token $token"}).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
    */
  }
}