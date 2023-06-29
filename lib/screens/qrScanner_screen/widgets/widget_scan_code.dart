import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../core/models/scanned_qr_model.dart';
import '../../../theme/theme.dart';
import '../../scan_item_view_screen/scan_item_vew_screen.dart';
import '../view_models/qr_services.dart';
import 'custom_snackbar.dart';
import 'widget_appBar.dart';

class ScanQrCodeScreen extends StatefulWidget {
  const ScanQrCodeScreen({Key? key}) : super(key: key);

  @override
  State<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            widgetAppBar(),
            Expanded(
              // flex: 5,
              child: _buildQrView(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: AppTheme.primaryColor,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.resumeCamera();
    controller.scannedDataStream.listen((scanData) {
      log('scanned result:\n ${scanData.code}');
      controller.pauseCamera();

      try {
        // _getData(scanData.code.toString());

        InvoiceModel data = validateQrCodeStringEncryption(
            scannedString: scanData.code.toString());

        log(data.sellerName.toString());

        Get.off(() => ScanItemViewScreen(
              dateTime: data.invoiceDate.toString(),
              invoiceNumber: data.sellerTaxNumber,
              name: data.sellerName,
              price: data.invoiceTotal,
              vat: data.taxTotal,
            
            ));
      } catch (e) {
        log(e.toString());

        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //   content: Text("Invalid Qr Code"),
        //   duration: Duration(milliseconds: 500),
        // ));
        Get.back();
        customSnackBar("Invalid!", "Please scan valied QR code..");
      }
    });
  }

  ///fetch data from scanned result
  _getData(String result) {
    ///decode string (base 64)
    String decoded = utf8.decode(base64Url.decode(result));

    ///remove first exp
    String data = decoded.split("+")[1];

    ///get name
    String name = data.split("")[0];

    ///remove again first exp
    data = data.split("")[1];

    ///get invoice number
    String invoiceNo = data.split("")[0];

    ///remove again first exp
    data = data.split("")[1];

    ///get date and time
    String dateTime = data.split("")[0];

    ///remove again first exp
    data = data.split("")[1];

    ///get prics
    String price = data.split("")[0];
    String vatPrice = data.split("")[1];

    Get.off(() => ScanItemViewScreen(
          dateTime: dateTime,
          invoiceNumber: invoiceNo,
          name: name,
          price: price,
          vat: vatPrice,
          // index: index,
        ));

    log("name: $name invoiceNo: $invoiceNo dateTime: $dateTime price: $price vatPrice: $vatPrice");
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
