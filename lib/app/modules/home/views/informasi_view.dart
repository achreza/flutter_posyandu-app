import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:posyandu_app/app/constant.dart';

class InformasiView extends StatelessWidget {
  const InformasiView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Text(
                'Informasi Kehamilan',
                style: headingStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/images/ibu.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Apa itu Kehamilan?',
                          style: bodyBoldStyle,
                        ),
                        Text(
                          'penyatuan dari spermatozoa dan ovum dan dilanjutkan dengan nidasi. Bila dihitung dari saat fertilisasi hingga lahirnya bayi, kehamilan normal akan berlangsung dalam waktu 40 minggu atau 9 bulan menurut kalender internasional',
                          style: bodyStyle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/images/perawatan.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bagaimana perawatan pra Hamil',
                          style: bodyBoldStyle,
                        ),
                        Text(
                          '''
    - Pastikan sudah mendapatkan vaksin 
    - Mengontrol kesehatan kronis 
    - Konsumsi makanan sehat 
    - Mengikuti jadwal dokter''',
                          style: bodyStyle,
                          maxLines: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //Separator
            Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/images/perawatan2.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Persiapan Persalinan',
                          style: bodyBoldStyle,
                        ),
                        Text(
                          'Ada beberapa jenis persalinan seperti persalinan normal, persalinan vakum, atau persalinan dengan bantuan alat bantu seperti forceps. Anda juga dapat mempersiapkan diri dengan melakukan teknik pernapasan yang tepat serta mempelajari tanda-tanda persalinan yang segera harus dihadapi.',
                          style: bodyStyle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //Separator
            Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/images/pregnant1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lebih lanjut tentang kehamilan',
                          style: bodyBoldStyle,
                        ),
                        Text(
                          'Kehamilan adalah proses di mana seorang wanita membawa janin di dalam rahimnya. Proses kehamilan dimulai saat sel telur yang telah dibuahi oleh sperma menempel pada dinding rahim dan berkembang menjadi embrio. Kehamilan biasanya berlangsung selama 9 bulan atau sekitar 40 minggu, dihitung sejak hari pertama haid terakhir.',
                          style: bodyStyle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //Separator
            Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/images/pregnant2.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pentingnya Pemeriksaan Medis',
                          style: bodyBoldStyle,
                        ),
                        Text(
                          'Selama kehamilan, tubuh wanita mengalami berbagai perubahan fisik dan emosional, seperti peningkatan produksi hormon, kenaikan berat badan, dan perubahan dalam pola makan dan tidur. Pemeriksaan medis rutin dan perawatan prenatal sangat penting untuk memastikan kesehatan ibu dan bayi.',
                          style: bodyStyle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //Separator
            Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/images/pregnant3.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Macam macam Persalinan',
                          style: bodyBoldStyle,
                        ),
                        Text(
                          'Kehamilan dapat berakhir dengan persalinan normal, operasi caesar, atau keguguran. Setelah melahirkan, ibu membutuhkan waktu untuk pulih dan mengalami perubahan hormonal yang signifikan saat tubuhnya kembali ke kondisi sebelumnya.',
                          style: bodyStyle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
