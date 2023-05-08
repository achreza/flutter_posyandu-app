import 'package:hive_flutter/hive_flutter.dart';

class ProfileModel {
  //get profil from profile box
  String? get nama => Hive.box('profil').get('nama');
  String? get tglLahir => Hive.box('profil').get('tglLahir');
  String? get golDarah => Hive.box('profil').get('golDarah');
  int? get tb => Hive.box('profil').get('tb');
  int? get bb => Hive.box('profil').get('bb');
  String? get tglMenikah => Hive.box('profil').get('tglMenikah');
}
