import 'package:flutter/material.dart';
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
      body: Center(
        child: Text('Home page'),
      ),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
