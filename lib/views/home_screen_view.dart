import 'package:flutter/material.dart';

import '../controllers/method_channel_controller.dart';
import '../utils/snackbar_utils.dart';
import '../widgets/cs_button.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  void _checkBluetooth() async {
    try {
      bool? status = await MethodChannelController.checkBluetoothStatus();

      if (status == null) {
        showSnackbar('Bluetooth not supported on device');
      } else {
        showSnackbar('Bluetooth is enabled? $status');
      }
    } catch (_) {
      showSnackbar('Failed to check bluetooth', seconds: 1);
    }
  }

  void _checkGPS() async {
    try {
      bool? status = await MethodChannelController.checkGPSStatus();

      if (status == null) {
        showSnackbar('GPS not supported on device');
      } else {
        showSnackbar('GPS is enabled? $status');
      }
    } catch (_) {
      showSnackbar('Failed to check GPS', seconds: 1);
    }
  }

  void _oneArgument() async {
    try {
      int value = await MethodChannelController.getValue();

      showSnackbar('Value: $value');
    } catch (_) {
      showSnackbar('Err', seconds: 1);
    }
  }

  void _manyArguments() async {
    try {
      Map args = await MethodChannelController.sum();

      int num1 = args['num1'];
      int num2 = args['num2'];
      int sum = args['sum'];

      showSnackbar('$num1 + $num2 = $sum');
    } catch (_) {
      showSnackbar('Err', seconds: 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Method Channel'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CsButton(
                label: 'Check Bluetooth Status',
                onPressed: _checkBluetooth,
                icon: Icons.bluetooth,
                backgroundColor: Colors.blue[800],
              ),
              const SizedBox(height: 10),
              CsButton(
                label: 'Check GPS Status',
                onPressed: _checkGPS,
                backgroundColor: Colors.green[800],
                icon: Icons.location_on,
              ),
              const SizedBox(height: 10),
              CsButton(
                label: 'One Argument',
                onPressed: _oneArgument,
                backgroundColor: Colors.orange[800],
                icon: Icons.numbers,
              ),
              const SizedBox(height: 10),
              CsButton(
                label: 'Many Arguments',
                onPressed: _manyArguments,
                backgroundColor: Colors.purple[800],
                icon: Icons.list,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
