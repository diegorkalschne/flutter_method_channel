package kalschne.diego.flutter_method_channel;

import android.bluetooth.BluetoothAdapter;
import android.location.LocationManager;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.HashMap;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "kalschne.diego.flutter.method_channel";

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        GeneratedPluginRegistrant.registerWith(new FlutterEngine(this));
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            if (call.method.equals("checkBluetooth")) {
                                Boolean response = checkBluetooth();

                                result.success(response);
                            } else if (call.method.equals("checkGPS")) {
                                Boolean response = checkGPS();

                                result.success(response);
                            } else if (call.method.equals("getValue")) {
                                // Retrieving only one argument
                                int value = (int) call.arguments;

                                result.success(value);
                            } else if (call.method.equals("sumValues")) {
                                // Retrieving multiple arguments
                                HashMap args = (HashMap) call.arguments;
                                int num1 = (int) args.get("num1");
                                int num2 = (int) args.get("num2");

                                int sum = sum(num1, num2);

                                result.success(sum);
                            } else {
                                result.notImplemented();
                            }
                        }
                );
    }


    private Boolean checkBluetooth() {
        BluetoothAdapter bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        if (bluetoothAdapter == null) {
            // Device does not support Bluetooth
            return null;
        }

        return bluetoothAdapter.isEnabled();
    }

    private Boolean checkGPS() {
        final LocationManager manager = (LocationManager) getSystemService(getContext().LOCATION_SERVICE);

        if (manager == null) {
            // Device does not support GPS
            return null;
        }

        return manager.isProviderEnabled(LocationManager.GPS_PROVIDER);
    }

    private int sum(int a, int b) {
        return a + b;
    }
}
