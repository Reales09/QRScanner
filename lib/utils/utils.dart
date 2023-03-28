import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/scan_model.dart';

launchUrl(BuildContext context, ScanModel scan) async {
  final url = scan.valor;

  if (scan.tipo == 'http') {
    if (!await (url).startsWith('http')) {
      await launch('http://$url');
    } else {
      await launch(url);
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
