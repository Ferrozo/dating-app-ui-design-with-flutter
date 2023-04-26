import 'package:dating_app_ui_design_with_flutter/src/core/app_colors.dart';
import 'package:dating_app_ui_design_with_flutter/src/services/get_users.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../common/export_widgets.dart';
import '../../../core/app_assets.dart';
import '../export_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final users = GetUsers();
  List _users = [];

  @override
  void initState() {
    super.initState();
    users.getAllUsers().then((result) {
      setState(() {
        _users = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.gradientColors,
          begin: Alignment.topRight,
          end: const Alignment(0.8, 1),
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
                icon: Image.asset(
                  AppAssets.settingIcon,
                  width: 25,
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
                child: Wrap(
                  children: List.generate(
                    _users.length,
                    (index) {
                      return HistoryContainer(
                        wasViewed: _users[index]['viewed'],
                        name: _users[index]['firstName'],
                        img: _users[index]['img'],
                        isActive: _users[index]['isOnline'],
                      );
                    },
                  ),
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
                    '${_users.length}',
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
                  child: _users.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xff76bbaa),
                          ),
                        )
                      : Wrap(
                          children: List.generate(
                            _users.length,
                            (index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => DetailsPage(
                                        img: _users[index]['img'],
                                        age: _users[index]['age'],
                                        firstName: _users[index]['firstName'],
                                        isOnline: _users[index]['isOnline'],
                                        lastName: _users[index]['lastName'],
                                        location: _users[index]['location'],
                                        messages: _users[index]['messages'],
                                      ),
                                    ),
                                  );
                                },
                                child: MatchCard(
                                  img: _users[index]['img'],
                                  name: _users[index]['firstName'],
                                  matchPercent:
                                      _users[index]['percentMatch'].toString(),
                                  isActive: _users[index]['isOnline'],
                                  age: _users[index]['age'],
                                ),
                              );
                            },
                          ),
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
