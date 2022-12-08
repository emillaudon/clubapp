import '../widgets/qr_presenter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../models/qr_code.dart';
import 'package:flutter/material.dart';

class QrService {
  
  QrImage createQrImage(Qr qrCode) {
    // Return QR code
    return QrImage(
          data: 'jfdasfasfkasf',
          version: QrVersions.auto,
          size: 320,
          gapless: false,
     );
  }
}