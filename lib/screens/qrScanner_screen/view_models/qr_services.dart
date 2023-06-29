import 'dart:convert';
import 'dart:typed_data';

import '../../../core/models/scanned_qr_model.dart';
import 'errors.dart';

InvoiceModel validateQrCodeStringEncryption({required String scannedString}) {
  try {
    const Base64Decoder b64Decoder = Base64Decoder();
    scannedString = scannedString.trim().replaceAll(RegExp(r"\s+"), "");
    final Uint8List qrCodeAsBytes = b64Decoder.convert(scannedString);
    int start = 0, end = 0, index = 0;
    InvoiceModel scannedInvoice = InvoiceModel.empty();
    for (int counter = 0; counter < 5; counter++) {
      index = start + 1;
      end = start + qrCodeAsBytes[index] + 2;
      start = index + 1;

      var value = utf8.decode(qrCodeAsBytes.sublist(start, end));
      if (counter > 2) {
        // value = value + " SAR";
      }
      if (counter == 0) {
        scannedInvoice = scannedInvoice.copyWith(sellerName: value);
      }
      if (counter == 1) {
        scannedInvoice = scannedInvoice.copyWith(sellerTaxNumber: value);
      }
      if (counter == 2) {
        scannedInvoice = scannedInvoice.copyWith(invoiceDate: value);
      }
      if (counter == 3) {
        scannedInvoice = scannedInvoice.copyWith(invoiceTotal: value);
      }
      if (counter == 4) {
        scannedInvoice = scannedInvoice.copyWith(taxTotal: value);
      }
      start = end;
    }
    return scannedInvoice;
  } catch (e) {
    throw InvalidQrCodeException("presentation.home.invalidScanError");
  }
}
