import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:posyandu_app/app/constant.dart';
import 'package:posyandu_app/app/modules/home/controllers/home_controller.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ProfilView extends GetView<HomeController> {
  ProfilView({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();

  //if in box already have data, then use it
  //if not, then use default value

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 12),
          child: Text(
            'Profil',
            style: headingStyle,
          ),
        ),
        Container(
          child: Image.asset('assets/images/ibu.png', width: 100, height: 100),
        ),
        Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 12),
                child: TextFormField(
                  controller: controller.namaCtr,
                  decoration: inputDecoration('Masukkan Nama'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () => showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100))
                            .then((value) {
                          controller.tglLahirCtr.text =
                              DateFormat.yMMMd().format(value!).toString();
                        }),
                        child: Text('Pilih Tanggal Lahir'),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: TextFormField(
                        controller: controller.tglLahirCtr,
                        readOnly: true,
                        decoration: inputDecoration('Tanggal Lahir'),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                child: TextFormField(
                  controller: controller.golDarahCtr,
                  decoration: inputDecoration('Masukkan Golongan Darah'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                child: TextFormField(
                  controller: controller.tbCtr,
                  keyboardType: TextInputType.number,
                  decoration: inputDecoration('Masukkan Tinggi Badan'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                child: TextFormField(
                  controller: controller.bbCtr,
                  keyboardType: TextInputType.number,
                  decoration: inputDecoration('Masukkan Berat Badan'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () => showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100))
                            .then((value) {
                          controller.tglMenikahCtr.text =
                              DateFormat.yMMMd().format(value!).toString();
                        }),
                        child: Text('Pilih Tanggal Menikah'),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: TextFormField(
                        controller: controller.tglMenikahCtr,
                        readOnly: true,
                        decoration: inputDecoration('Tanggal Menikah'),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 24),
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      controller.saveProfil(
                          controller.namaCtr.text,
                          controller.tglLahirCtr.text,
                          controller.golDarahCtr.text,
                          controller.tbCtr.text,
                          controller.bbCtr.text,
                          controller.tglMenikahCtr.text);
                      Get.offAllNamed('/home', arguments: controller.loginUser);
                    } else {
                      Get.snackbar('Error', 'Data tidak valid');
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  child: Text('Simpan Data'),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}

InputDecoration inputDecoration(String labelText,
    {String? prefix, String? helperText}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    helperText: helperText,
    labelText: labelText,
    labelStyle: TextStyle(color: Colors.grey),
    fillColor: Colors.white,
    filled: true,
    prefixText: prefix,
    prefixIconConstraints: BoxConstraints(minWidth: 60),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black)),
  );
}
