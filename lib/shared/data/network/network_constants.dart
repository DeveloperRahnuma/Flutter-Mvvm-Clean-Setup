import 'dart:io';

class NetworkConstants {
  static const baseURL = "https://jsonplaceholder.typicode.com/";

  static const Map<String, String> headers = {
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.contentTypeHeader: "application/json",
  };
}
