import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final int stok = 40;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Koperasi Sekolah'),
        ),
        body: Card(
          margin:const EdgeInsets.all(12), 
          child: ListTile(
            leading: const Icon(Icons.inventory_2),
            title:  const Text( 
              'Buku Tulis',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text(
              'Anggota Rp3.000  |  Umum Rp3.500',
            ),
            trailing: Text(
              'Stok' + stok.toString(),
              style: TextStyle(color: stok == 0 ? Colors.red : Colors.black),
              ),
          ),
        ),
      ),
    );
  }
}