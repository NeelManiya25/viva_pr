

import 'dart:convert';

Quotes quotesFromJson(String str) => Quotes.fromJson(json.decode(str));

String quotesToJson(Quotes data) => json.encode(data.toJson());

class Quotes {
  Quotes({

     this.text = '',
    this.author = '',

  });


  String text;
  String author;


  factory Quotes.fromJson(Map<String, dynamic> json) => Quotes(

        text: json["text"],
        author: json["author"],

      );

  Map<String, dynamic> toJson() => {

        "text": text,
        "author": author,

      };
}
