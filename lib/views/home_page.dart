import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qrcode_tracing_user/views/scan_result.dart';
import 'package:qrcode_tracing_user/widgets/drawer_widget.dart';
import 'package:qrcode_tracing_user/widgets/text_widget.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final box = GetStorage();
  String qrCode = 'Unknown';

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
      print(qrCode);

      box.write('result', qrCode);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ResultPage()));
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }

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
                scanQRCode();
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const ResultPage()));
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
