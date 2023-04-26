import 'package:dating_app_ui_design_with_flutter/src/core/app_colors.dart';
import 'package:flutter/material.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({
    super.key,
    required this.userImg,
    required this.name,
  });
  final String userImg;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: 70,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.shade600.withOpacity(0.4),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2.5,
          child: Container(
            margin: const EdgeInsets.only(bottom: 0),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(userImg),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(100)),
          ),
        ),
        Positioned(
          top: 55,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              '$name is waiting for a message from you!',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
