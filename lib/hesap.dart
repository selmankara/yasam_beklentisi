import 'package:yasam_beklentisi/kullanici_verisi.dart';

class Hesap {
  KullaniciVerisi _kullaniciVerisi;

  Hesap(this._kullaniciVerisi);

  double hesaplama() {
    double sonuc;
    sonuc =
        90 + _kullaniciVerisi.sporYapilanGun - _kullaniciVerisi.icilenSigara;
    sonuc = sonuc + (_kullaniciVerisi.boy / _kullaniciVerisi.kilo);
    if (_kullaniciVerisi.seciliCinsiyet == 'KADIN') {
      return sonuc + 3;
    } else {
      return sonuc - 1;
    }
  }
}
