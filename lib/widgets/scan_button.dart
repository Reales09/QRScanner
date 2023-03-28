import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/utils/utils.dart';

import '../provider/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        child: Icon(Icons.filter_center_focus_outlined),
        onPressed: () async {
          // final barcodeScanRes = 'https://flutter.dev';
          final barcodeScanRes = 'geo:4.687968, -74.060216';

          if (barcodeScanRes == '-1') {
            return;
          }

          final scanListProvider =
              Provider.of<ScanListProvider>(context, listen: false);
          scanListProvider.nuevoScan(barcodeScanRes);

          final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);

          launchUrl(context, nuevoScan);

          // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          //     '#3D8BEF', 'Cancelar', true, ScanMode.DEFAULT);
          // print('Resultado $barcodeScanRes');
        });
  }
}
