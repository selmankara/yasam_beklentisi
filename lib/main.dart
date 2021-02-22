import 'package:flutter/material.dart';

import 'input_page.dart';

void main() {
  runApp(YasamBeklentisi());
}

class YasamBeklentisi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.lightBlue[300],
          primaryColor: Colors.lightBlue[300]),
      home: GirisSayfasi(),
    );
  }
}
