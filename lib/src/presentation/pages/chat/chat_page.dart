import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../common/export_widgets.dart';
import '../../../core/app_colors.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String picture = 'assets/models/model_02.jpg';
    return PageTransition(
      durationValue: 1000,
      offset: 150,
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
                    const Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.greenColor),
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
                const ChatHeader(
                  userImg: picture,
                ),
                const SizedBox(height: 10),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height - 280,
                  ),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.bottomRight,
                            child: const MessageContainer(
                              isSent: false,
                              messageText: 'Hello! How are doing? ',
                              imgSender: picture,
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: const MessageContainer(
                              isSent: true,
                              messageText: 'Hi! Great?',
                              imgSender: picture,
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: const MessageContainer(
                              isSent: false,
                              messageText:
                                  'Hello! How are doing? \n Can I see You tomorrow? ',
                              imgSender: picture,
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: const MessageContainer(
                              isSent: true,
                              messageText: 'Hi! Great?',
                              imgSender: picture,
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: const MessageContainer(
                              isSent: false,
                              messageText: 'Hello! How are doing? ',
                              imgSender: picture,
                            ),
                          ),
                        ],
                      )),
                ),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  alignment: Alignment.bottomCenter,
                  child: const MessageInputBox(),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
