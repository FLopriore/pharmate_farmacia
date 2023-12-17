import 'dart:convert';
import 'dart:io';

import 'package:pharmate_farmacia/authorization/login_secure_storage.dart';

class Authorization {
  final String _url = "https://feddynventor.ddns.net/pharm8/";


  // Sign up
  // Returns true if signup was successful.
  // The token is stored in secure storage and is used to login later.
  Future<bool> signUp(String name, String password, String cf, String city) async {
    String firebaseToken = "string"; //Useless implementation of FCM token 
    var data = {
      'fullname': name,
      'password': password,
      'cf': cf,
      'citta': city,
      "firebase_token": firebaseToken,
    };

    String fullUrl = '${_url}auth/signup';

    HttpClient client = HttpClient();
    // Bypass SSL certification
    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest request = await client.postUrl(Uri.parse(fullUrl));
    request.headers.set('Content-Type', 'application/json');
    request.headers.set('accept', '*/*');
    request.add(utf8.encode(jsonEncode(data)));
    HttpClientResponse response = await request.close();

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(await response.transform(utf8.decoder).join());
      LoginSecureStorage.storeLoginSecureStorage('loginToken', responseJson['token']);
      return true;
    }
    return false;
  }

  // Login
  Future<bool> login(String cf, String password) async {
    String fullUrl = '${_url}auth/login';
    String firebaseToken = "string";
    var data = {
      "cf": cf,
      "password": password,
      "firebase_token": firebaseToken,
    };

    HttpClient client = HttpClient();
    // Bypass SSL certification
    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest request = await client.postUrl(Uri.parse(fullUrl));
    request.headers.set('Content-Type', 'application/json');
    request.headers.set('accept', '*/*');
    request.add(utf8.encode(jsonEncode(data)));
    HttpClientResponse result = await request.close();
    if (result.statusCode == 200) {
      var responseJson = jsonDecode(await result.transform(utf8.decoder).join());
      LoginSecureStorage.storeLoginSecureStorage('loginToken', responseJson['token']);
      return true;
    }
    return false;
  }

  //Create a new Pharma
  Future<bool> createPharmacy(String nome,String citta,String pharmacyCode) async {
    var data = {
      'nome': nome,
      'citta':citta,
      'codice_farmacia': pharmacyCode
      };
    String fullUrl = '${_url}farmacie/create';

    HttpClient client = HttpClient();
    // Bypass SSL certification
    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest request = await client.postUrl(Uri.parse(fullUrl));
    request.headers.set('Content-Type', 'application/json');
    request.headers.set('accept', '*/*');

    String? token = await LoginSecureStorage.getLoginSecureStorage('loginToken');
    request.headers.set('Authorization', 'Bearer ${token!}');
    request.add(utf8.encode(jsonEncode(data)));
    HttpClientResponse response = await request.close();
    if ((response.statusCode == 200) || (response.statusCode == 201)) {
      return true;
    }
    return false;
  }
}
