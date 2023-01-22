import 'package:qr_flutter/qr_flutter.dart';
import '../models/qr_code.dart';
import 'package:flutter/material.dart';

class QrService {
  
  QrImage createQrImage(Qr qrCode) {
    // Return QR code
    return QrImage(
          data: qrCode.formatQrData(),
          version: QrVersions.auto,
          size: 320,
          gapless: false,
          //embeddedImage: const AssetImage('assets/images/whk.png'),
          embeddedImageStyle: QrEmbeddedImageStyle(size: const Size(50, 20)),
     );
  }
}