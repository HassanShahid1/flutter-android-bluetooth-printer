import 'dart:io';

import 'package:android_bluetooth_printer/android_bluetooth_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

String path = "";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory documentsDirectory = await getApplicationDocumentsDirectory();

  ByteData byteData = await rootBundle.load('images/bill.png');
  File x = await File("${documentsDirectory.path}/bill.png").writeAsBytes(
      byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  path = x.path;
  print(await x.length());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () async {
                try {
                  String theText = "[C]<u><font size='big'>ORDER N°045</font></u>\n" +
                      "[L]\n" +
                      "[C]<img>$path</img>\n" +
                      "[C]================================\n" +
                      "[L]\n";
                  await AndroidBluetoothPrinter.print(theText);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.toString()),
                    ),
                  );
                }
              },
              child: Text('Print):'),
            );
          }),
        ),
      ),
    );
  }
}
