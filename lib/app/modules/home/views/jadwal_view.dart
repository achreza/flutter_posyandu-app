import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:posyandu_app/app/components/button_tanggal.dart';
import 'package:posyandu_app/app/constant.dart';
import 'package:posyandu_app/app/modules/home/controllers/home_controller.dart';

class JadwalPosyanduView extends GetView<HomeController> {
  JadwalPosyanduView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat.yMMMd().format(DateTime.now()),
                      style: subHeadingStyle,
                    ),
                    Text(
                      "Hari ini",
                      style: headingStyle,
                    )
                  ],
                ),
              ),
              ButtonTanggal(
                label: "Tambah Jadwal",
                onTap: () {
                  var tanggalDipilih = DateTime.now();
                  Get.bottomSheet(
                    Container(
                        height: 300,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: DatePicker(
                                DateTime.now(),
                                height: 100,
                                width: 80,
                                initialSelectedDate: DateTime.now(),
                                selectionColor: Colors.blue,
                                selectedTextColor: Colors.white,
                                dateTextStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                                onDateChange: (date) {
                                  // New date selected
                                  tanggalDipilih = date;
                                },
                              ),
                            ),
                            //form with 1 fiels only
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: TextFormField(
                                controller: controller.jadwalController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Nama Kegiatan"),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.red),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text("Batal")),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.green),
                                      onPressed: () {
                                        controller.tambahJadwal(
                                            tanggalDipilih.toString());
                                        Get.offAllNamed('/home',
                                            arguments: controller.loginUser);
                                      },
                                      child: Text("Simpan")),
                                ],
                              ),
                            )
                          ],
                        )),
                  );
                },
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: DatePicker(
            DateTime.now(),
            height: 100,
            width: 80,
            initialSelectedDate: DateTime.now(),
            deactivatedColor: Colors.grey,
            activeDates:
                controller.listKey.map((e) => DateTime.parse(e)).toList(),
            selectionColor: Colors.blue,
            selectedTextColor: Colors.white,
            dateTextStyle: TextStyle(
                fontSize: 20,
                color: Colors.black45,
                fontWeight: FontWeight.w600),
            onDateChange: (date) {
              Get.bottomSheet(
                Container(
                  height: 300,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    DateFormat.yMMMd().format(date),
                                    style: subHeadingStyle,
                                  ),
                                  Text(
                                    "Jadwal Hari ini",
                                  )
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(Icons.close))
                          ],
                        ),
                      ),
                      Expanded(
                          child: controller.listJadwal.length < 1
                              ? Center(
                                  child: Text("Masih Belum ada Jadwal"),
                                )
                              : Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              DateFormat.yMMMd()
                                                  .format(date)
                                                  .toString(),
                                              style: subHeadingStyle,
                                            ),
                                            Text(
                                              controller.posyanduBox
                                                  .get(date.toString()),
                                              style: headingStyle,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          alignment: Alignment.centerLeft,
          child: Text(
            "Jadwal Posyandu",
            style: subHeadingStyle,
          ),
        ),

        //list jadwal
        Expanded(
            child: controller.listJadwal.length < 1
                ? Center(
                    child: Text("Masih Belum ada Jadwal"),
                  )
                : ListView.builder(
                    itemCount: controller.listJadwal.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                            color: DateTime.parse(controller.listKey[index])
                                        .isBefore(DateTime.now()) ==
                                    true
                                ? DateTime.parse(controller.listKey[index])
                                        .isAtSameMomentAs(DateTime.now())
                                    ? Colors.blue
                                    : Colors.red
                                : Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      DateFormat.yMMMd().format(DateTime.parse(
                                          controller.listKey[index])),
                                      style: bodyBoldStyle.copyWith(
                                          color: Colors.white)),
                                  Text(
                                    controller.listJadwal[index],
                                    style:
                                        bodyStyle.copyWith(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                      title: "Hapus Jadwal",
                                      middleText:
                                          "Apakah anda yakin ingin menghapus jadwal ini?",
                                      textConfirm: "Hapus",
                                      textCancel: "Batal",
                                      confirmTextColor: Colors.white,
                                      cancelTextColor: Colors.red,
                                      buttonColor: Colors.redAccent,
                                      onCancel: () {
                                        Get.back();
                                      },
                                      onConfirm: () {
                                        controller.hapusJadwal(
                                            controller.listKey[index]);
                                        Get.offAllNamed('/home',
                                            arguments: controller.loginUser);
                                      });
                                },
                                icon: Icon(
                                  Icons.done,
                                  color: Colors.green[300],
                                  size: 30,
                                ))
                          ],
                        ),
                      );
                    })),
      ],
    );
  }
}
