import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'cinsiyet_kutusu.dart';
import 'constants.dart';
import 'kullanici_verisi.dart';
import 'my_container.dart';
import 'result_page.dart';

class GirisSayfasi extends StatefulWidget {
  @override
  _GirisSayfasiState createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  String seciliCinsiyet;
  double icilenSigara = 0.0;
  double sporYapilanGun = 0.0;
  int boy = 170;
  int kilo = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('BOY'),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('KİLO'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                children: [
                  Text('Haftada Kaç Gün Spor Yapıyorsunuz?',
                      style: kMetinStili),
                  Text(sporYapilanGun.round().toString(), style: kSayiStili),
                  Slider(
                      min: 0,
                      max: 7,
                      divisions: 7,
                      value: sporYapilanGun,
                      onChanged: (double newValue) {
                        setState(() {
                          sporYapilanGun = newValue;
                        });
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Günde Kaç Sigara İçiyorsunuz?', style: kMetinStili),
                  Text(icilenSigara.round().toString(), style: kSayiStili),
                  Slider(
                    min: 0,
                    max: 30,
                    value: icilenSigara,
                    onChanged: (double newValue) {
                      setState(() {
                        icilenSigara = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    tusaBas: () {
                      setState(() {
                        seciliCinsiyet = 'KADIN';
                      });
                    },
                    renk: seciliCinsiyet == 'KADIN'
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: CinsiyetKutusu(
                      cinsiyet: 'KADIN',
                      ikon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    tusaBas: () {
                      setState(() {
                        seciliCinsiyet = 'ERKEK';
                      });
                    },
                    renk: seciliCinsiyet == 'ERKEK'
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: CinsiyetKutusu(
                      cinsiyet: 'ERKEK',
                      ikon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
            height: 50,
            child: FlatButton(
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SonucSayfasi(
                      KullaniciVerisi(
                          boy: boy,
                          kilo: kilo,
                          seciliCinsiyet: seciliCinsiyet,
                          sporYapilanGun: sporYapilanGun,
                          icilenSigara: icilenSigara),
                    ),
                  ),
                );
              },
              child: Text('HESAPLA', style: kMetinStili),
            ),
          )
        ],
      ),
    );
  }

  Row buildRowOutlineButton(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(quarterTurns: 3, child: Text(label, style: kMetinStili)),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
            quarterTurns: 3,
            child: Text(label == 'BOY' ? boy.toString() : kilo.toString(),
                style: kSayiStili)),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                  borderSide: BorderSide(color: Colors.lightBlue),
                  child: Icon(
                    FontAwesomeIcons.plus,
                    size: 10,
                  ),
                  onPressed: () {
                    setState(() {
                      label == 'BOY' ? boy++ : kilo++;
                    });
                  }),
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                  borderSide: BorderSide(color: Colors.lightBlue),
                  child: Icon(
                    FontAwesomeIcons.minus,
                    size: 10,
                  ),
                  onPressed: () {
                    setState(() {
                      label == 'BOY' ? boy-- : kilo--;
                    });
                  }),
            )
          ],
        ),
      ],
    );
  }
}
