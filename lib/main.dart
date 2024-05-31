import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InternetPaymentPage(),
    );
  }
}

class InternetPaymentPage extends StatefulWidget {
  @override
  _InternetPaymentPageState createState() => _InternetPaymentPageState();
}

class _InternetPaymentPageState extends State<InternetPaymentPage> {
  bool _isExpanded = false;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Perlu diketahui, proses verifikasi transaksi dapat memakan waktu hingga 1x24 jam.',
              style: TextStyle(color: Colors.orange),
            ),
            SizedBox(height: 16),
            CheckboxListTile(
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
              title: AnimatedCrossFade(
                firstChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rp450.000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Due date on 16 Feb 2024'),
                  ],
                ),
                secondChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rp450.000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Due date on 16 Feb 2024'),
                    SizedBox(height: 8),
                    Text('Provider: Nethome'),
                    Text('ID Pelanggan: 1123645718921'),
                    Text('Paket Layanan: Nethome 100 Mbps'),
                    Text('Status: Closed', style: TextStyle(color: Colors.red)),
                  ],
                ),
                crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 300),
              ),
              secondary: IconButton(
                icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ),
            if (_isExpanded)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(),
              ),
            CheckboxListTile(
              value: !_isExpanded && _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rp240.000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Due date on 20 Feb 2024'),
                ],
              ),
              secondary: Icon(Icons.arrow_forward_ios, size: 16),
            ),
            Spacer(),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Payment', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('Rp450.000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), backgroundColor: Colors.red,
              ),
              child: Text('PAY NOW', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
