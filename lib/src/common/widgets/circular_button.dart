import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.isFavorite,
  });
  final Function onPressed;
  final Icon icon;
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      height: isFavorite ? 55 : 45,
      width: isFavorite ? 55 : 45,
      decoration: BoxDecoration(
        color: isFavorite ? Colors.white : Colors.grey.withOpacity(0.6),
        borderRadius: BorderRadius.circular(60),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          onPressed();
        },
        icon: icon,
        color: isFavorite ? Colors.pink : Colors.white,
        iconSize: 25,
      ),
    );
  }
}
