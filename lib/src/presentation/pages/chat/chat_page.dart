import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../common/export_widgets.dart';
import '../../../core/app_colors.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({
    super.key,
    required this.name,
    required this.image,
    required this.messages,
    required this.isOnline,
  });

  final String name;
  final String image;
  final List<dynamic>? messages;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return PageTransition(
      durationValue: 900,
      offset: 200,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.gradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: isOnline
                              ? AppColors.greenColor
                              : Colors.grey.shade500),
                    )
                  ],
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {}, icon: const Icon(UniconsLine.ellipsis_v))
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ChatHeader(
                  name: name,
                  userImg: image,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height - 280,
                          ),
                          child: ListView.builder(
                              itemCount: messages!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  alignment: Alignment.bottomRight,
                                  child: MessageContainer(
                                    isSender: messages![index]['isSender'],
                                    messageText: messages![index]['object'],
                                    imgSender: image,
                                    time: messages![index]['time'],
                                  ),
                                );
                              }),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 20),
                          alignment: Alignment.bottomCenter,
                          child: const MessageInputBox(),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
