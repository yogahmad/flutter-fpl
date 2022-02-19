import 'package:http/http.dart';

class CommonClient {
  late Client _instance;
  String baseUrl = "127.0.0.1:8000";

  CommonClient() {
    _instance = Client();
  }

  Future<Response> get(url, {params}) {
    if (params != null) {
      var uri = Uri.http(baseUrl, url, params);
      return _instance.get(uri);
    }
    var uri = Uri.http(baseUrl, url);
    return _instance.get(uri);
  }
}
