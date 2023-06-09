import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/direcciones_page.dart';
import 'package:qr_scanner/pages/mapas_page.dart';
import 'package:qr_scanner/provider/db_provider.dart';
import 'package:qr_scanner/provider/ui_provider.dart';
import 'package:qr_scanner/widgets/custom_navigator.dart';
import 'package:qr_scanner/widgets/scan_button.dart';

import '../provider/scan_list_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('historial'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                final scanListProvider =
                    Provider.of<ScanListProvider>(context, listen: false);
                scanListProvider.borrarTodos();
              },
              icon: Icon(Icons.delete_forever_outlined))
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    //obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);

    //Cambiar para mostrar la página respectiva
    final currentIndex = uiProvider.selectedMenuOpt;
    //TODO: temporal leer la base de daos

    //final tempScan = new ScanModel(valor: 'http://google.com');
    final tempScan = new ScanModel(valor: 'geo:4.553496, -74.135632');
    DBProvider.db.nuevoScan(tempScan);

    //final tempScan = new ScanModel(valor: 'http://googlemyles.com');
    // DBProvider.db.nuevoScan(tempScan);
    // DBProvider.db.deleteAllScan().then(print);

    //Usar el ScanListProvider

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return MapasPage();

      case 1:
        scanListProvider.cargarScansPorTipo('http');
        return DireccionesPage();

      default:
        return MapasPage();
    }
  }
}
