import 'package:flutter/material.dart';

class DetailMenu extends StatelessWidget {
  const DetailMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            const TextButton(
              onPressed: null,
              child: Text(
                'For You',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              height: 2,
              width: 30,
              color: Colors.white,
            )
          ],
        ),
        Column(
          children: [
            TextButton(
              onPressed: null,
              child: Text(
                'Nearby',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
