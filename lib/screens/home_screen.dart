import 'package:flutter/material.dart';
import 'package:newapp/screens/second_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  String quote = "hi";
  String author = "bye";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                // title: Text(title),
                ),
            body: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      quote,
                      style: TextStyle(fontSize: 20, fontFamily: "serif"),
                    )),
                Align(alignment: Alignment.bottomRight, child: Text(author)),
                ElevatedButton(
                    onPressed: () async {
                      var url = Uri.parse(
                          'https://goquotes-api.herokuapp.com/api/v1/random?count=1');
                      var response = await http.get(url);

                      var data = jsonDecode(response.body);
                      setState(() {
                        quote = data["quotes"][0]["text"];
                        author = data["quotes"][0]["author"];
                      });
                      // // ignore: use_build_context_synchronously
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => SecondScreen(
                      //         authorName: authorName, quoteText: quoteText)));
                    },
                    child: const Text("Go to next quote")),
              ],
            )));
  }
}
