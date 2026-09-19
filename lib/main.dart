import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Game',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TOKO GAME - Top Up & QRIS')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Pembayaran QRIS', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Image.asset('qris_saya.jpg', height: 300),
          const SizedBox(height: 20),
          const Text('Scan QRIS di atas untuk pembayaran', textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
