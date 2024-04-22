import 'package:cash_control/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// enum AlertType2 { success, error, info, warning }

class CustomAlert {
  static void show({
    required BuildContext context,
    AlertType? type,
    required String title,
    required String description,
    List<DialogButton>? buttons,
  }) {
    Color alertColor;
    Color buttonColor;

    switch (type) {
      case AlertType.success:
        alertColor = AppColors.color4;
        buttonColor = AppColors.color3;
        break;
      case AlertType.error:
        alertColor = AppColors.color4;
        buttonColor = AppColors.color6;
        break;
      case AlertType.info:
        alertColor = AppColors.color4;
        buttonColor = Colors.blue;
        break;
      case AlertType.warning:
        alertColor = AppColors.color4;
        buttonColor = Colors.amber;
        break;
      default:
        alertColor = AppColors.color5;
        buttonColor = Colors.blue;
    }

    Alert(
      context: context,
      type: type,
      title: title,
      desc: description,
      style: AlertStyle(
        backgroundColor: alertColor,
        titleStyle: TextStyle(color: AppColors.color5, fontWeight: FontWeight.bold),
        descStyle: TextStyle(color: AppColors.color5),
      ),
      buttons: buttons ?? [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          color: buttonColor,
          width: 120,
          child: Text(
            "OK",
            style: TextStyle(color: AppColors.color5, fontSize: 20),
          ),
        )
      ],
    ).show();
  }
}
