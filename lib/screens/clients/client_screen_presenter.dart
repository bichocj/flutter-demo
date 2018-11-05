import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:flutter_demo/models/Client.dart';

abstract class ClientScreenContract {
  void onClientSuccess(List<Client> clients);
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

  requestClients(String token) async {
    var url  =  "/clients/api/clients/";
    Map<String, String> queryParameters = Map<String, String>();

    return getData(url, queryParameters, token).then((dynamic rr){
      final JsonDecoder _decoder = new JsonDecoder();
      final dynamic res =  _decoder.convert(rr);

      final itemsTmp = res.map((i) => new Client.map(i));
      final items = itemsTmp.cast<Client>();    
      _view.onClientSuccess(items.toList());
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