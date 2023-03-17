import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/shared/types.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:time_tracker/configs/lottie_manager.dart';

class FailDialog {
  bool _dialogIsOpen = false;

  /// [_context] Required to show the alert.
  // Can only be accessed with the constructor.
  late BuildContext? _context;

  FailDialog(this.title, this.message);

  final String title;
  final String message;

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
          msg: message,
          title: title,
          lottieBuilder: Lottie.asset(
            LottieManager.fail,
            fit: BoxFit.contain,
          ),
          customView: Container(),
          customViewPosition: CustomViewPosition.BEFORE_ACTION,
          context: context,
          actions: [
            IconsButton(
              onPressed: () {
                Navigator.pop(context);
              },
              text: 'OK',
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