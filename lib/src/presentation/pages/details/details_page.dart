import 'package:dating_app_ui_design_with_flutter/src/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../common/export_widgets.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.img,
    required this.description,
    required this.age,
  });
  final String img;
  final String description;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(img),
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
                    description,
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
                      color: AppColors.greenColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Icon(
                    UniconsLine.location_point,
                    color: Colors.white54,
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Location',
                    style: TextStyle(
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
                    ),
                    CircularButton(
                      icon: const Icon(Icons.favorite),
                      isFavorite: true,
                      onPressed: () {},
                    ),
                    CircularButton(
                      icon: const Icon(UniconsLine.comment_alt_dots),
                      isFavorite: false,
                      onPressed: () {},
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
                  fontSize: 15,
                  color: AppColors.blackColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
