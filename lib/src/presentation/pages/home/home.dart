import 'package:dating_app_ui_design_with_flutter/src/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../common/export_widgets.dart';
import '../export_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                ),
              ),
              const Text(
                'My matches',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  image: const DecorationImage(
                      image: AssetImage('assets/profile.png')),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 30, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Likes',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '28',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    HistoryContainer(
                      isViewed: true,
                      isActive: true,
                      name: 'John',
                      img: 'assets/models/model_01.jpg',
                    ),
                    HistoryContainer(
                      isViewed: false,
                      isActive: false,
                      name: 'John',
                      img: 'assets/models/model_02.jpg',
                    ),
                    HistoryContainer(
                      isViewed: false,
                      isActive: true,
                      name: 'John',
                      img: 'assets/models/model_03.jpg',
                    ),
                    HistoryContainer(
                      isViewed: true,
                      isActive: false,
                      name: 'John',
                      img: 'assets/models/model_04.jpg',
                    ),
                    HistoryContainer(
                      isViewed: false,
                      isActive: false,
                      name: 'John',
                      img: 'assets/models/model_02.jpg',
                    ),
                    HistoryContainer(
                      isViewed: true,
                      isActive: true,
                      name: 'John',
                      img: 'assets/models/model_04.jpg',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  const Text(
                    'Matches',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '28',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const DetailsPage(
                                    age: 26,
                                    description: 'Lucian Paloma, 26',
                                    img: 'assets/models/model_01.jpg',
                                  ),
                                ),
                              );
                            },
                            child: const MatcheCard(
                              img: 'assets/models/model_01.jpg',
                              isActive: false,
                              name: 'Rihanna',
                              matchPercent: '80% match',
                            ),
                          ),
                          const MatcheCard(
                            img: 'assets/models/model_02.jpg',
                            isActive: true,
                            name: 'Rihanna',
                            matchPercent: '80% match',
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const MatcheCard(
                            img: 'assets/models/model_03.jpg',
                            isActive: false,
                            name: 'Rihanna',
                            matchPercent: '80% match',
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const ChatPage(),
                                ),
                              );
                            },
                            child: const MatcheCard(
                              img: 'assets/models/model_04.jpg',
                              isActive: true,
                              name: 'Rihanna',
                              matchPercent: '80% match',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 75,
          color: Colors.black,
          child: const BottomMenu(),
        ),
      ),
    );
  }
}
