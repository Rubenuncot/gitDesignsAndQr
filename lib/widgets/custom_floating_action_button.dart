import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_sql/providers/scan_provider.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        
        //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#1C4C96", "Cancelar", false, ScanMode.QR);
        final scanProvider = Provider.of<ScanProvider>(context, listen: false);

        String barcodeScanRes = "https://google.com";
        String barcodeScanRes2 = "geo:38.871713, -6.991445";
        scanProvider.nuevoScan(barcodeScanRes2);
        scanProvider.nuevoScan(barcodeScanRes);
        print(barcodeScanRes);
        print(barcodeScanRes2);
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}