import 'package:flutter/material.dart';
import 'config/app_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  double? total;
  double? biayaAdmin;

  void hitungTotal() {
    final harga = double.tryParse(_controller.text);
    if (harga == null || harga <= 0) return;
    setState(() {
      biayaAdmin = harga * 0.02;
      total = harga + biayaAdmin!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppConfig.appName)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Masukkan Nominal",
                border: OutlineInputBorder(),
                prefixText: "Rp ",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: hitungTotal,
              child: const Text("Hitung Biaya", style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 30),
            if (total != null) ...[
              Text("Biaya Admin: Rp ${biayaAdmin!.toStringAsFixed(0)}", style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text("TOTAL BAYAR: Rp ${total!.toStringAsFixed(0)}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue)),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green, minimumSize: const Size(double.infinity, 50)),
                child: const Text("Bayar via QRIS", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
