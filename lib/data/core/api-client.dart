import 'dart:convert';

import 'package:http/http.dart';

class ApiClient {
  final Client _client;

  ApiClient({required Client client}) : _client = client;

  dynamic get(String apiPath) async {
    final response = await _client.get(Uri.parse(apiPath), headers: {
      "Content-Type": "application/json",
    });
    final responseByte = utf8.decode(response.bodyBytes);
    final responseBody = jsonDecode(responseByte);

    //print(responseBody);
    return responseBody;
  }
}
