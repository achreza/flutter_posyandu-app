import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:posyandu_app/app/data/models/login_model.dart';
import 'package:posyandu_app/app/modules/auth/views/auth_view.dart';

class AuthController extends GetxController {
  final posyanduBox = Hive.box('auth');
  LoginModel? profile;
  Rx<FormType> formType = FormType.menu.obs;

  Future<void> login(String username, String password) async {
    //if username and password exist in hive box
    if (posyanduBox.containsKey(username) &&
        posyanduBox.get(username) == password) {
      profile = LoginModel(
        username: username,
        email: posyanduBox.get(username + 'email'),
        phone: posyanduBox.get(username + 'phone'),
      );
      Get.offAllNamed('/home', arguments: profile);
    } else {
      Get.snackbar('Error', 'Username atau password salah');
    }
  }

  //create register function with hive box username, password, phone number, and email
  Future<void> register(String username, String password, String phoneNumber,
      String email) async {
    //if username and password not exist in hive box
    if (!posyanduBox.containsKey(username)) {
      posyanduBox.put(username, password);
      posyanduBox.put(username + 'phone', phoneNumber);
      posyanduBox.put(username + 'email', email);
      profile = LoginModel(
        username: username,
        email: email,
        phone: phoneNumber,
      );
      Get.offAllNamed('/home', arguments: profile);
    } else {
      Get.snackbar('Error', 'Username sudah terdaftar');
    }
  }

  @override
  void onInit() {
    super.onInit();
    openBox();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void openBox() async {
    await Hive.openBox('posyandu');
  }
}
