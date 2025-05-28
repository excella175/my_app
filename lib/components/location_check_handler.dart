// components/location_check_handler.dart
import 'package:flutter/material.dart';
import 'package:my_app/components/location_check_overlay.dart';
import 'package:my_app/components/location_result_dialog.dart';

class LocationCheckHandler {
  static void showLocationCheck({
    required BuildContext context,
    required Function() onSuccess,
  }) {
    bool isOverlayVisible = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext overlayContext) {
        return LocationCheckOverlay(
          onLocationCheckComplete: () {
            if (isOverlayVisible) {
              Navigator.of(overlayContext).pop();
              isOverlayVisible = false;
            }
          },
          onShowResult: (bool success, String message) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext resultContext) {
                return LocationResultDialog(
                  success: success,
                  message: message,
                );
              },
            ).then((_) {
              // If successful, call the success callback
              if (success) {
                onSuccess();
              }
            });
          },
        );
      },
    );
  }
}
