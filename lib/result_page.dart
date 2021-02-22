import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yasam_beklentisi/hesap.dart';
import 'package:yasam_beklentisi/kullanici_verisi.dart';

import 'constants.dart';
import 'hesap.dart';

class SonucSayfasi extends StatelessWidget {
  final KullaniciVerisi _kullaniciVerisi;
  SonucSayfasi(this._kullaniciVerisi);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sonuç Sayfası'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Center(
                child: Text(
              Hesap(_kullaniciVerisi).hesaplama().round().toString(),
              style: kMetinStili,
            )),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'GERİ DÖN',
                style: kMetinStili,
              ),
            ),
          )
        ],
      ),
    );
  }
}
