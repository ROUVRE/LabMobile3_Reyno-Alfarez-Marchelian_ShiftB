import 'package:flutter/material.dart';
import 'package:tugas_pertemuan_3/sidemenu.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
      ),
      body: const Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tentang aplikasi ini',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Selamat datang di Higher or Lower, permainan tebak angka yang sederhana tapi seru! Dalam permainan ini, Kamu ditugaskan untuk menebak apakah angka selanjutnya lebih tinggi atau lebih rendah dari angka sekarang. Setiap angka berada di range antara 1 hingga 100. Uji nalurimu dengan memprediksi hasilnya dalam 10 percobaan.",
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
      drawer: const Sidemenu(),
    );
  }
}
