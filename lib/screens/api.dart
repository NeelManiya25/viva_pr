import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:viva_pr/model/quotes.dart';

class Api {
  static Future<Quotes?> getQuotes() async {
    Uri url = Uri.parse('https://type.fit/api/quotes');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      print("success");
      return Quotes.fromJson(jsonDecode(response.body));
    } else {
      print("error in getting data");
    }
  }
}
