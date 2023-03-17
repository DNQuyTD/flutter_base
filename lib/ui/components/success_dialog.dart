import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/shared/types.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:time_tracker/configs/lottie_manager.dart';

class SuccessDialog {
  bool _dialogIsOpen = false;

  /// [_context] Required to show the alert.
  // Can only be accessed with the constructor.
  late BuildContext? _context;

  SuccessDialog();

  /// [close] Closes the progress dialog.
  void close() {
    if (_dialogIsOpen && _context != null) {
      Navigator.pop(_context!);
      _dialogIsOpen = false;
    }
  }

  void show(BuildContext context) {
    _context = context;
    if (_context != null) {
      _dialogIsOpen = true;
      Dialogs.materialDialog(
          color: Theme.of(_context!).dialogBackgroundColor,
          msg: 'Congratulations, you won 500 points',
          title: 'Congratulations',
          lottieBuilder: Lottie.asset(
            LottieManager.success,
            fit: BoxFit.contain,
          ),
          customView: Container(),
          customViewPosition: CustomViewPosition.BEFORE_ACTION,
          context: context,
          actions: [
            IconsButton(
              onPressed: () {},
              text: 'Claim',
              iconData: Icons.done,
              color: Theme.of(context).primaryColor,
              textStyle: const TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
          ]);
    }
  }

  void dispose() {
    _context = null;
  }
}