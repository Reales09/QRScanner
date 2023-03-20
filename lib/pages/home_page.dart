import 'package:flutter/material.dart';
import 'package:qr_scanner/pages/direcciones_page.dart';
import 'package:qr_scanner/pages/mapas_page.dart';
import 'package:qr_scanner/widgets/custom_navigator.dart';
import 'package:qr_scanner/widgets/scan_button.dart';

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
              onPressed: () {}, icon: Icon(Icons.delete_forever_outlined))
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
    //Cambiar para mostrar la página respectiva
    final currentIndex = 1;

    switch (currentIndex) {
      case 0:
        return MapasPage();

      case 1:
        return DireccionesPage();

      default:
        return MapasPage();
    }
  }
}
