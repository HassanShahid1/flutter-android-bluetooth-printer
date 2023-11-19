# android_bluetooth_printer

A plugin for Android Bluetooth Printer.
Only works on Android.
This plugin implements [ESCPOS-ThermalPrinter-Android](https://github.com/DantSu/ESCPOS-ThermalPrinter-Android) to print using most of ESC-POS printers.
Ow, and it doesn't requires any location permission.

## Getting Started

You just need to write

```
String theText = "[C]<u><font size='big'>ORDER 045</font></u>\n" +
  "[L]\n" +
  "[C]<img>$path</img>\n" +
  "[C]================================\n" +
  "[L]\n";
await AndroidBluetoothPrinter.print(theText);
```

*you can print image* 


Follow the text format provided by [ESCPOS-ThermalPrinter-Android](https://github.com/DantSu/ESCPOS-ThermalPrinter-Android)

