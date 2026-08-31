import 'package:flutter/material.dart';

class KeranjangItem extends StatefulWidget {
  final int stok;
  final int harga;

  const KeranjangItem({
    super.key,
    required this.stok,
    required this.harga,
  });

  @override
  State<KeranjangItem> createState() => _KeranjangItemState();
}

class _KeranjangItemState extends State<KeranjangItem> {
  int jumlah = 1;

  @override
  Widget build(BuildContext context) {
    int totalHarga = jumlah * widget.harga;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            if (jumlah > 0) {
              setState(() {
                jumlah--;
              });
            }
          },
        ),

        Column(
          children: [
            Text(jumlah.toString()),
            Text(
              'Rp$totalHarga',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            if (jumlah < widget.stok) {
              setState(() {
                jumlah++;
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Stok tidak mencukupi!'),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}