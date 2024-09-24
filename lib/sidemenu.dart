import 'package:flutter/material.dart';
import 'package:tugas_pertemuan_3/home_page.dart';
import 'package:tugas_pertemuan_3/about_page.dart';
import 'package:tugas_pertemuan_3/highlow_page.dart';

class Sidemenu extends StatelessWidget {
  const Sidemenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text("What's on your mind?"),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Navigasi halaman Home
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.play_arrow),
            title: const Text('Higher or Lower'),
            onTap: () {
              // Navigasi halaman Higher or Lower
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HigherLowerGame(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              // Navigasi halaman About
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
