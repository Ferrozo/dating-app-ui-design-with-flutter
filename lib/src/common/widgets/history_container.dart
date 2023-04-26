import 'package:dating_app_ui_design_with_flutter/src/core/app_colors.dart';
import 'package:flutter/material.dart';

class HistoryContainer extends StatelessWidget {
  const HistoryContainer({
    super.key,
    required this.wasViewed,
    required this.name,
    required this.img,
    required this.isActive,
  });
  final bool wasViewed;
  final String name;
  final String img;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.only(left: 8),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: wasViewed ? Colors.transparent : AppColors.redColor,
              width: 1.8,
            ),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(70),
          ),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(60),
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 3),
            Container(
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: isActive ? AppColors.greenColor : Colors.white,
              ),
            )
          ],
        )
      ],
    );
  }
}
