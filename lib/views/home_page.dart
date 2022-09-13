import 'package:flutter/material.dart';
import 'package:qrcode_tracing_user/views/scan_result.dart';
import 'package:qrcode_tracing_user/widgets/drawer_widget.dart';
import 'package:qrcode_tracing_user/widgets/text_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showAboutDialog(
                  context: context,
                  applicationName: 'QRCode',
                  applicationIcon:
                      Image.asset('assets/images/logoonly.png', height: 50),
                  applicationLegalese: "QR Code based Livestock Tracing",
                  applicationVersion: 'v1.0');
            },
            icon: const Icon(Icons.info),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: TextBold(text: 'Home', fontSize: 22, color: Colors.white),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ResultPage()));
              },
              child: Image.asset('assets/images/qr.png', height: 180),
            ),
            const SizedBox(
              height: 50,
            ),
            TextRegular(
                text: 'Tap here to Scan', fontSize: 12, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
