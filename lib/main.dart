import 'package:flutter/material.dart';
import 'barang_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KoperasiPage(),
    );
  }
}

class KoperasiPage extends StatefulWidget {
  const KoperasiPage({super.key});

  @override
  State<KoperasiPage> createState() => _KoperasiPageState();
}

class _KoperasiPageState extends State<KoperasiPage> {
  // Data barang koperasi
  final List<Map<String, dynamic>> daftarBarang = const [
    {
      'nama': 'Buku Tulis Bergaris 58 Lembar Sampul Tebal',
      'anggota': 3000,
      'umum': 3500,
      'stok': 0,
    },
    {
      'nama': 'Pulpen',
      'anggota': 2500,
      'umum': 3000,
      'stok': 25,
    },
    {
      'nama': 'Roti',
      'anggota': 5000,
      'umum': 5500,
      'stok': 15,
    },
    {
      'nama': 'Pensil',
      'anggota': 2000,
      'umum': 2500,
      'stok': 30,
    },
    {
      'nama': 'Penghapus',
      'anggota': 1500,
      'umum': 2000,
      'stok': 20,
    },
    {
      'nama': 'Penggaris',
      'anggota': 6000,
      'umum': 7000,
      'stok': 12,
    },
    {
      'nama': 'Spidol',
      'anggota': 6000,
      'umum': 5000,
      'stok': 17,
    },
    {
      'nama': 'Lem Kertas',
      'anggota': 4000,
      'umum': 4500,
      'stok': 10,
    },
    {
      'nama': 'Biskuit',
      'anggota': 5500,
      'umum': 6000,
      'stok': 17,
    },
    {
      'nama': 'Susu Kotak',
      'anggota': 4500,
      'umum': 5000,
      'stok': 22,
    },
  ];

  late TextEditingController _controller;
  String kataCari = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasilCari = daftarBarang
        .where((b) => b['nama'].toString().toLowerCase().contains(kataCari))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Koperasi Sekolah'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Cari barang...',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (nilai) {
              setState(() {
                kataCari = nilai.toLowerCase();
              });
            },
          ),
          Text("Lebar Layar: " + MediaQuery.of(context).size.width.toString()),
         Expanded(
  child: LayoutBuilder(
    builder: (context, constraints) {
      int kolom;

      if (constraints.maxWidth < 600) {
        kolom = 1;
      } else if (constraints.maxWidth < 900) {
        kolom = 2;
      } else {
        kolom = 3;
      }

      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: kolom,
          childAspectRatio: 3,
        ),
        itemCount: hasilCari.length,
        itemBuilder: (context, index) {
          final barang = hasilCari[index];

          return BarangCard(
            nama: barang['nama'],
            hargaAnggota: barang['anggota'],
            stok: barang['stok'],
            kategori: '',
          );
        },
      );
    },
  ),
),
        ],
      ),
    );
  }
}