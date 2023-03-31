import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        
        //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#1C4C96", "Cancelar", false, ScanMode.QR);
        String barcodeScanRes = "https://google.com";
        print(barcodeScanRes);
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}