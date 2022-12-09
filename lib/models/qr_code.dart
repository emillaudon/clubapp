class Qr {
  final String receiver;
  final String subject;
  final String body;

  const Qr({
    required this.receiver,
    required this.subject,
    required this.body,
    });

  String formatQrData() {
    String subjectFormatted = subject;
    subjectFormatted.replaceAll(RegExp(' '), '%20');

    String bodyFormatted = body;
    bodyFormatted.replaceAll(RegExp(' '), '%20');

    String qrText = 'mailto: $receiver?subject=$subjectFormatted&body=$body';

    return qrText;
  }
}