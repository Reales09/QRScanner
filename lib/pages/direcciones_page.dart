import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/scan_list_provider.dart';
import '../widgets/scan_tiles.dart';

class DireccionesPage extends StatelessWidget {
  const DireccionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScanTiles(
      tipo: 'http',
    );
  }
}
