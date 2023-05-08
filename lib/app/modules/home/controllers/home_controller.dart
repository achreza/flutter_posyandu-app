import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:posyandu_app/app/data/models/login_model.dart';
import 'package:posyandu_app/app/data/models/profil_model.dart';
import 'package:posyandu_app/app/modules/home/views/informasi_view.dart';
import 'package:posyandu_app/app/modules/home/views/jadwal_view.dart';
import 'package:posyandu_app/app/modules/home/views/profil_view.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement HomeController

  final posyanduBox = Hive.box('posyandu');
  final profilBox = Hive.box('profil');
  final LoginModel loginUser = Get.arguments;

  List<dynamic> listJadwal = Hive.box('posyandu').values.toList();
  List<dynamic> listKey = Hive.box('posyandu').keys.toList();

  TextEditingController jadwalController = TextEditingController();

  TextEditingController namaCtr = TextEditingController();
  TextEditingController tglLahirCtr = TextEditingController();
  TextEditingController golDarahCtr = TextEditingController();
  TextEditingController tbCtr = TextEditingController();
  TextEditingController bbCtr = TextEditingController();
  TextEditingController tglMenikahCtr = TextEditingController();

  final ProfileModel profilUser = ProfileModel();
  final RxInt tabIndex = 0.obs;
  late TabController tabController;

  final List<Widget> pages = [
    InformasiView(),
    JadwalPosyanduView(),
    ProfilView()
  ];

  void changeTab(int index) {
    tabIndex.value = index;
    tabController.animateTo(index);
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: pages.length, vsync: this);
    loadProfile();
  }

  @override
  void onReady() {
    super.onReady();
    notifService();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void tambahJadwal(String tanggal) {
    posyanduBox.put(tanggal, jadwalController.text);
  }

  void hapusJadwal(String tanggal) {
    posyanduBox.delete(tanggal);
  }

  //save profil
  void saveProfil(String nama, String tglLahir, String golDarah, String tb,
      String bb, String tglMenikah) {
    profilBox.put('nama', nama);
    profilBox.put('tglLahir', tglLahir);
    profilBox.put('golDarah', golDarah);
    profilBox.put('tb', tb);
    profilBox.put('bb', bb);
    profilBox.put('tglMenikah', tglMenikah);
  }

  void loadProfile() {
    namaCtr.text = profilBox.get('nama') ?? '';
    tglLahirCtr.text = profilBox.get('tglLahir') ?? '';
    golDarahCtr.text = profilBox.get('golDarah') ?? '';
    tbCtr.text = profilBox.get('tb') ?? '';
    bbCtr.text = profilBox.get('bb') ?? '';
    tglMenikahCtr.text = profilBox.get('tglMenikah') ?? '';
  }

  void notifService() {
    if (listKey.length > 0) {
      for (var i = 0; i < listKey.length; i++) {
        if (DateFormat.yMMMd().format(DateTime.parse(listKey[i])).toString() ==
                DateFormat.yMMMd()
                    .format(DateTime.parse(DateTime.now().toString()))
                    .toString() &&
            DateFormat.yMMMd().format(DateTime.parse(listKey[i])).toString() ==
                DateFormat.yMMMd()
                    .format(DateTime.parse(
                        DateTime.now().add(Duration(days: 1)).toString()))
                    .toString()) {
          notifHariInidanBesok();
          print('har ini dan besok');
        }
        if (DateFormat.yMMMd().format(DateTime.parse(listKey[i])).toString() ==
            DateFormat.yMMMd()
                .format(DateTime.parse(DateTime.now().toString()))
                .toString()) {
          notifHariIni();
          print('harini');
        } else if (DateFormat.yMMMd()
                .format(DateTime.parse(listKey[i]))
                .toString() ==
            DateFormat.yMMMd()
                .format(DateTime.parse(
                    DateTime.now().add(Duration(days: 1)).toString()))
                .toString()) {
          notifBesok();
          print('besok');
        }
      }
    }
  }

  notifBesok() {
    Get.snackbar('Notifikasi', 'Anda memiliki jadwal posyandu besok');
  }

  void notifHariIni() {
    Get.snackbar('Notifikasi', 'Anda memiliki jadwal posyandu Hari ini');
  }

  void notifHariInidanBesok() {
    Get.snackbar(
        'Notifikasi', 'Anda memiliki jadwal posyandu Hari ini dan Besok');
  }
}
