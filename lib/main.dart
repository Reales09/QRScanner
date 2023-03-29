import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/home_page.dart';
import 'package:qr_scanner/pages/mapa_page.dart';
import 'package:qr_scanner/provider/scan_list_provider.dart';
import 'package:qr_scanner/provider/ui_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'QR Scanner',
          initialRoute: 'home',
          routes: {
            'home': (_) => HomePage(),
            'mapa': (_) => MapaPage(),
          },
          theme: ThemeData(
              primaryColor: (Colors.deepPurple),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepPurple))),
    );
  }
}
