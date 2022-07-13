import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  var authorName;

  var quoteText;

  SecondScreen({Key? key, required this.quoteText, required this.authorName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: Column(children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  quoteText,
                  style: TextStyle(fontSize: 20, fontFamily: "serif"),
                )),
            Align(alignment: Alignment.bottomRight, child: Text(authorName))
          ])),
    );
  }
}
