import 'package:dating_app_ui_design_with_flutter/src/core/app_colors.dart';
import 'package:flutter/material.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({
    super.key,
    required this.isSent,
    required this.messageText,
    required this.imgSender,
  });

  final bool isSent;
  final String messageText;
  final String imgSender;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1,
      child: TransitionAnimation(
        durationValue: 1100,
        offset: 140.0,
        isSent: isSent,
        child: Column(
          crossAxisAlignment:
              isSent ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment:
                  isSent ? MainAxisAlignment.start : MainAxisAlignment.end,
              children: [
                isSent
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
                      color:
                          isSent ? AppColors.blackColor : AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              '00:00h',
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
    required this.isSent,
  });
  final Widget child;
  final double offset;
  final bool isSent;
  final int durationValue;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1,
      origin: const Offset(50.0, 50.0),
      child: TweenAnimationBuilder(
        curve: Curves.easeInSine,
        duration: isSent
            ? Duration(milliseconds: durationValue + 200)
            : Duration(milliseconds: durationValue),
        tween: Tween(begin: 1.0, end: 0.0),
        builder: ((context, value, child) {
          return Transform.translate(
            offset: Offset(isSent ? value * -offset : value * offset, 0.0),
            child: child,
          );
        }),
        child: child,
      ),
    );
  }
}
