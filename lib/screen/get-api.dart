import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PageOneApi extends StatefulWidget {
  const PageOneApi({super.key});

  @override
  State<PageOneApi> createState() => _PageOneApiState();
}

class _PageOneApiState extends State<PageOneApi> {
  List<dynamic> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Get Api',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          final price =
              product['price']?.toString() ?? 'N/A'; 
          final name = product['title'] ?? 'No Title'; 
          final rating = product['rating']?.toString() ??
              'No Rating'; 

          return GridTile(
            child: Column(
              children: [
                Text(name),
                Text(price),
                Text(rating),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Tombol ditekan, memanggil getData');
          getData();
        },
        child: Icon(
          Icons.download,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
      ),
    );
  }

  void getData() async {
    const url = 'https://dummyjson.com/products';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      print('Data dari API: $json'); // Menampilkan data dari API
      setState(() {
        products = json['products']; // Ambil daftar produk
      });
      print('data berhasil');
    } else {
      print('Gagal mendapatkan data: ${response.statusCode}');
    }
  }
}
