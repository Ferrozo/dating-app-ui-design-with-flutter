import 'package:dating_app_ui_design_with_flutter/src/core/app_colors.dart';
import 'package:flutter/material.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({
    super.key,
    required this.isSender,
    required this.messageText,
    required this.imgSender,
    required this.time,
  });

  final bool isSender;
  final String messageText;
  final String imgSender;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1,
      child: TransitionAnimation(
        durationValue: 700,
        offset: 140.0,
        isSender: isSender,
        child: Column(
          crossAxisAlignment:
              isSender ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment:
                  isSender ? MainAxisAlignment.start : MainAxisAlignment.end,
              children: [
                isSender
                    ? Container(
                        margin: const EdgeInsets.only(right: 5),
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                            image: AssetImage(imgSender),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(),
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(top: 20),
                  constraints: const BoxConstraints(
                    minHeight: 40,
                    minWidth: 100,
                  ),
                  decoration: BoxDecoration(
                    color: isSender
                        ? AppColors.whiteColor
                        : AppColors.redColor.withOpacity(0.6),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(isSender ? 0 : 20),
                      topLeft: const Radius.circular(20),
                      topRight: const Radius.circular(20),
                      bottomRight: Radius.circular(isSender ? 20 : 0),
                    ),
                  ),
                  child: Text(
                    messageText,
                    style: TextStyle(
                      color: isSender
                          ? AppColors.blackColor
                          : AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              time,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TransitionAnimation extends StatelessWidget {
  const TransitionAnimation({
    super.key,
    required this.child,
    required this.durationValue,
    required this.offset,
    required this.isSender,
  });
  final Widget child;
  final double offset;
  final bool isSender;
  final int durationValue;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1,
      origin: const Offset(50.0, 50.0),
      child: TweenAnimationBuilder(
        curve: Curves.easeInSine,
        duration: isSender
            ? Duration(milliseconds: durationValue + 200)
            : Duration(milliseconds: durationValue),
        tween: Tween(begin: 1.0, end: 0.0),
        builder: ((context, value, child) {
          return Transform.translate(
            offset: Offset(isSender ? value * -offset : value * offset, 0.0),
            child: child,
          );
        }),
        child: child,
      ),
    );
  }
}
