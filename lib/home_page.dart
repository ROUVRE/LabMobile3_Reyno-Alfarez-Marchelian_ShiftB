import 'package:flutter/material.dart';
import 'package:tugas_pertemuan_3/sidemenu.dart';
import 'package:tugas_pertemuan_3/highlow_page.dart';
import 'package:tugas_pertemuan_3/about_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var namaUser;

  void _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    namaUser = prefs.getString('username');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _loadUsername();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Selamat datang, $namaUser',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HigherLowerPage(),
                  ),
                );
              },
              child: const Text('Mainkan Higher or Lower'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  ),
                );
              },
              child: const Text('Tentang Aplikasi'),
            ),
          ],
        ),
      ),
      drawer: const Sidemenu(),
    );
  }
}
