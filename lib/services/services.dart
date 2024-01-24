import 'package:chatgpt_clone/constants/constants.dart';
import 'package:chatgpt_clone/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class Services {
  // You pass the context as a required argument
  static Future<void> showModelSheet({required BuildContext context}) async {
    await showModalBottomSheet(
        backgroundColor: scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return const Padding(
            padding: EdgeInsets.all(18.0),
            child: Row(
              children: [
                Flexible(
                  child: TextWidget(
                    label: "Choose model:",
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
