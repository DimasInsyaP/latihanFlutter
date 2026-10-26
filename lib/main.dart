import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.blue,
          secondary: Colors.orange,
        ),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    DataDiriPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard Mahasiswa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Data Diri',
          ),
        ],
      ),
    );
  }
}

// 1. Halaman Dashboard Mahasiswa
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Mahasiswa'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.orange.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Text(
            'Selamat Datang di Dashboard Mahasiswa!',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

//Data Diri
class DataDiriPage extends StatelessWidget {
  const DataDiriPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String nama = 'Dimas Insya Putra';
    const String nim = '1124169248';
    const String prodi = 'Teknik Informatika';
    const String umur = '20 Tahun';
    const String kotaAsal = 'Tangerang';
    const String gmail = '1124160248@global.ac.id';
    const String hobi = 'Mencari arti hidup';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Diri Mahasiswa'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainPage()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange, width: 1.5),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama     : $nama', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  SizedBox(height: 8),
                  Text('NIM      : $nim', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  SizedBox(height: 8),
                  Text('Prodi    : $prodi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  SizedBox(height: 8),
                  Text('Umur     : $umur', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  SizedBox(height: 8),
                  Text('Kota Asal: $kotaAsal', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  SizedBox(height: 8),
                  Text('Gmail    : $gmail', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  SizedBox(height: 8),
                  Text('Hobi     : $hobi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}