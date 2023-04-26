import 'package:dating_app_ui_design_with_flutter/src/core/app_assets.dart';
import 'package:dating_app_ui_design_with_flutter/src/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class MessageInputBox extends StatelessWidget {
  const MessageInputBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      constraints: const BoxConstraints(
        minHeight: 50,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.grey.shade600.withOpacity(0.4),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: TextField(
              style: TextStyle(
                color: AppColors.whiteColor.withOpacity(0.8),
              ),
              decoration: InputDecoration(
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Write here your message',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: AppColors.whiteColor.withOpacity(0.8),
                  )),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      UniconsLine.camera_plus,
                      size: 25,
                      color: Colors.grey.shade200,
                    )),
                IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {},
                    icon: Image.asset(
                      AppAssets.galleryIcon,
                      width: 22,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
