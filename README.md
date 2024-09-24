# TUGAS PERTEMUAN 3 - PRAKTIKUM PEMROGRAMAN MOBILE

Nama: Reyno Alfarez Marchelian

NIM: H1D022111

Shift Lama: E

Shift Baru: B

## PENJELASAN

![Lampiran Login](screenshot_login.png)

```
class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var namaUser;
```

Digunakan untuk mengontrol input username dan password dari pengguna.

```
void _saveUsername() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('username', _usernameController.text);
}
```

Fungsi ini digunakan untuk menyimpan username yang dimasukkan oleh pengguna ke dalam penyimpanan lokal menggunakan SharedPreferences.

```
_showInput(namaController, placeholder, isPassword) {
  return TextField(
    controller: namaController,
    obscureText: isPassword,
    decoration: InputDecoration(
      hintText: placeholder,
    ),
  );
}
```

Fungsi ini membuat widget TextField untuk kolom input pengguna.

---

![Lampiran Home](screenshot_home.png)

```
class _HomePageState extends State<HomePage> {
  var namaUser;

  void _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    namaUser = prefs.getString('username');
    setState(() {});
  }
```

Variabel namaUser untuk menyimpan nama pengguna yang dimuat dari penyimpanan lokal.
_loadUsername untuk memuat username yang diinput user dari penyimpanan lokal menggunakan SharedPreferences.

```
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
```

Digunakan untuk membuat tombol yang muncul di halaman Home, untuk membawa user ke halaman 'Higher or Lower' atau halaman 'About'

---

![Lampiran Side Menu](screenshot_sidemenu.png)

```
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
```

Digunakan untuk menampilkan menu-menu di side menu.

---

![Lampiran Higher or Lower](screenshot_.highlow.png)

![Lampiran About](screenshot_about.png)
