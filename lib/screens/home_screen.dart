import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:viva_pr/model/quotes.dart';
import 'package:viva_pr/screens/api.dart';



class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var size, height, width;
  Quotes? data;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(" Random Quotes"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh_outlined,
            ),
            iconSize: 30,
            onPressed: () {
              getQuotes();
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: getQuotes,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              width: width / 2,
              child: Card(
                margin: EdgeInsets.only(top: 20),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${data?.text?? "Don't talk about what you have done or what you are going to do."}',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(height: 22),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            data?.author ?? "Thomas Jefferson",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Null> getQuotes() async {
    data = await Api.getQuotes();
    setState(() {});
  }
}
