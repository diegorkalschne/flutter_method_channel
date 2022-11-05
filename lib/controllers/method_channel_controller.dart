// ignore_for_file: constant_identifier_names

import 'dart:math';

import 'package:flutter/services.dart';

class MethodChannelController {
  static const String _CHANNEL = 'kalschne.diego.flutter.method_channel';

  static const _platform = MethodChannel(_CHANNEL);

  static Future<bool?> checkBluetoothStatus() async {
    bool? response = await _platform.invokeMethod<bool?>('checkBluetooth');

    return response;
  }

  static Future<bool?> checkGPSStatus() async {
    bool? response = await _platform.invokeMethod<bool?>('checkGPS');

    return response;
  }

  static Future<int> getValue() async {
    int random = Random().nextInt(100);

    int value = await _platform.invokeMethod<int>('getValue', random) as int;

    return value;
  }

  static Future<Map> sum() async {
    int num1 = Random().nextInt(100);
    int num2 = Random().nextInt(100);

    Map args = {
      'num1': num1,
      'num2': num2,
    };

    int sum = await _platform.invokeMethod<int>('sumValues', args) as int;

    args.addAll({
      'sum': sum,
    });

    return args;
  }
}
