

import 'dart:convert';

Quotes quotesFromJson(String str) => Quotes.fromJson(json.decode(str));

String quotesToJson(Quotes data) => json.encode(data.toJson());

class Quotes {
  Quotes({

     this.content = '',
    this.author = '',

  });


  String content;
  String author;


  factory Quotes.fromJson(Map<String, dynamic> json) => Quotes(

        content: json["content"],
        author: json["author"],

      );

  Map<String, dynamic> toJson() => {

        "content": content,
        "author": author,

      };
}
