import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tugas_pertemuan_3/sidemenu.dart';

class HigherLowerGame extends StatelessWidget {
  const HigherLowerGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Higher or Lower',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HigherLowerPage(),
    );
  }
}

class HigherLowerPage extends StatefulWidget {
  @override
  _HigherLowerPageState createState() => _HigherLowerPageState();
}

class _HigherLowerPageState extends State<HigherLowerPage> {
  int jawaban = Random().nextInt(100) + 1;
  int attempt = 0;
  int kesempatan = 10;
  String hint = '';
  TextEditingController tebakanController = TextEditingController();

  void checkTebakan(String input) {
    var tebakan = int.tryParse(input);

    if (tebakan == null || tebakan < 1 || tebakan > 100) {
      setState(() {
        hint = 'Tebakan harus di antara 1-100!';
      });
      return;
    }

    setState(() {
      attempt++;
      kesempatan--;

      if (tebakan < jawaban) {
        hint = 'Terlalu kecil!';
      } else if (tebakan > jawaban) {
        hint = 'Terlalu besar!';
      } else {
        hint = 'Selamat, jawaban kamu benar! Setelah $attempt kali tebakan.';
        _showResultDialog('Selamat!',
            'Jawaban kamu benar setelah $attempt kali tebakan.\nJawabannya: $jawaban');
      }

      if (kesempatan == 0 && tebakan != jawaban) {
        hint = 'Kesempatan habis! Jawabannya adalah $jawaban.';
        _showResultDialog('Kesempatan habis!', 'Jawabannya adalah $jawaban.');
      }
    });
  }

  void _showResultDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                _resetGame();
              },
            ),
          ],
        );
      },
    );
  }

  void _resetGame() {
    setState(() {
      jawaban = Random().nextInt(100) + 1;
      attempt = 0;
      kesempatan = 10;
      hint = '';
      tebakanController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Higher or Lower'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Terdapat sebuah angka di antara 1-100. Kamu punya $kesempatan kesempatan.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: tebakanController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan tebakan kamu',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (kesempatan > 0) {
                  checkTebakan(tebakanController.text);
                }
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            Text(
              hint,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      drawer: const Sidemenu(),
    );
  }
}
