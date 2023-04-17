import 'package:dating_app_ui_design_with_flutter/src/core/app_colors.dart';
import 'package:flutter/material.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({
    super.key,
    required this.isSent,
    required this.messageText,
  });

  final bool isSent;
  final String messageText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isSent ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(top: 20),
          constraints: const BoxConstraints(
            minHeight: 40,
            minWidth: 100,
          ),
          decoration: BoxDecoration(
            color: isSent
                ? AppColors.whiteColor
                : AppColors.redColor.withOpacity(0.6),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(isSent ? 0 : 20),
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
              bottomRight: Radius.circular(isSent ? 20 : 0),
            ),
          ),
          child: Text(
            messageText,
            style: TextStyle(
              color: isSent ? AppColors.blackColor : AppColors.whiteColor,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '00:00h',
          style: TextStyle(color: AppColors.whiteColor),
        )
      ],
    );
  }
}
