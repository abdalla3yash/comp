
import 'package:comp/core/utils/values.dart';
import 'package:comp/core/view/components/app_bottom_sheet.dart';
import 'package:flutter/material.dart';


class AppSheets {
  static Future<T?> showBottomSheet<T>(BuildContext context, {required Widget child, String title = ""}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.s12)),
      ),
      constraints: BoxConstraints(maxHeight: deviceHeight * 0.8, minWidth: double.maxFinite),
      builder: (context) => AppBottomSheet(child: child),
    );
  }
}
