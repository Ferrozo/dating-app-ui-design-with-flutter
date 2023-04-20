import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.isFavorite,
    required this.isCenter,
  });
  final Function onPressed;
  final Widget icon;
  final bool isFavorite;
  final bool isCenter;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      height: isCenter ? 55 : 45,
      width: isCenter ? 55 : 45,
      decoration: BoxDecoration(
        color: isCenter ? Colors.white : Colors.grey.withOpacity(0.6),
        borderRadius: BorderRadius.circular(60),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          onPressed();
        },
        icon: icon,
        color: isCenter && isFavorite
            ? Colors.pink
            : isCenter && false == false
                ? Colors.black87
                : Colors.white,
        iconSize: isCenter ? 28 : 20,
      ),
    );
  }
}
