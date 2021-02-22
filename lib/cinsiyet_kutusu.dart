import 'package:flutter/material.dart';

import 'constants.dart';

class CinsiyetKutusu extends StatelessWidget {
  final String cinsiyet;
  final IconData ikon;
  CinsiyetKutusu({this.cinsiyet, this.ikon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          ikon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(
          height: 10,
        ),
        Text(cinsiyet, style: kMetinStili)
      ],
    );
  }
}
