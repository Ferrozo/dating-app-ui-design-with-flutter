import 'package:dating_app_ui_design_with_flutter/src/core/app_assets.dart';
import 'package:dating_app_ui_design_with_flutter/src/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../common/export_widgets.dart';
import '../chat/chat_page.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.location,
    required this.img,
    required this.isOnline,
    required this.age,
    required this.messages,
  });
  final String firstName;
  final String lastName;
  final String img;
  final bool isOnline;
  final int age;
  final String location;
  final List<dynamic> messages;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return PageTransition(
      durationValue: 800,
      offset: 200,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(widget.img),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Colors.black.withOpacity(0.2),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                const DetailMenu(),
                const Spacer(),
                IconButton(
                    onPressed: () {}, icon: const Icon(UniconsLine.ellipsis_v))
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${widget.firstName}  ${widget.firstName}, ${widget.age}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: widget.isOnline
                            ? AppColors.greenColor
                            : Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      UniconsLine.location_point,
                      color: Colors.white54,
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.location,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularButton(
                        icon: const Icon(UniconsLine.multiply),
                        isFavorite: false,
                        onPressed: () {},
                        isCenter: false,
                      ),
                      CircularButton(
                        icon: const Icon(Icons.favorite),
                        isFavorite: isFavorite,
                        onPressed: () {
                          setState(
                            () {
                              isFavorite = !isFavorite;
                            },
                          );
                        },
                        isCenter: true,
                      ),
                      CircularButton(
                        icon: Image.asset(
                          AppAssets.messageIcon,
                          width: 25,
                        ),
                        isFavorite: false,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ChatPage(
                                isOnline: widget.isOnline,
                                name: widget.firstName,
                                image: widget.img,
                                messages: widget.messages,
                              ),
                            ),
                          );
                        },
                        isCenter: false,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: Container(
            alignment: Alignment.center,
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            height: 70,
            child: Container(
              width: 300,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: TextButton(
                onPressed: null,
                child: Text(
                  'View Profile',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
