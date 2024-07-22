import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String _url;

  NetworkHelper(this._url);

  Future getData() async {
    http.Response res;
    res = await http.get(Uri.parse(_url));
    if (res.statusCode == 200) {
      print("GET SUCCESS!");
      return jsonDecode(res.body);
    } else {
      print("Error: ${res.statusCode}");
      return null;
    }
  }
}
