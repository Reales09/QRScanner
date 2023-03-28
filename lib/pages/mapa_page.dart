import 'package:flutter/material.dart';
import 'package:qr_scanner/models/scan_model.dart';

class MapaPage extends StatelessWidget {
  MapaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scan = ModalRoute.of(context)!.settings.arguments as ScanModel;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: Center(
        child: Text(scan.valor),
      ),
    );
  }
}
