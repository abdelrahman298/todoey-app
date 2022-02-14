import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todoey_app/module/register/register_screen.dart';
import 'package:todoey_app/shared/components/components.dart';
import 'package:todoey_app/shared/styles/colors.dart';
import 'package:todoey_app/shared/styles/icon_broken.dart';
import 'package:todoey_app/shared/network/local/cache_helper.dart';

class OnBoardingModel {
  String? image;
  String? firstText;
  String? bodyText;

  OnBoardingModel(
      {required this.image, required this.firstText, required this.bodyText});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  List<OnBoardingModel> boarding = [
    OnBoardingModel(
        image: 'assets/images/1.jpg',
        firstText: 'Plan',
        bodyText: 'plan your Time'),
    OnBoardingModel(
        image: 'assets/images/2.jpg',
        firstText: 'Edit',
        bodyText: 'Edit what you want'),
    OnBoardingModel(
        image: 'assets/images/3.jpg',
        firstText: 'Done',
        bodyText: 'Then done!'),
  ];

  void skipButton() {
    CacheHelper.setData(
      key: 'onBoaring',
      value: true,
    ).then((value) {
      navigateAndFinish(context, RegisterScreen());
    }).catchError((error) {
      print('error from skip on Boarding ${error.toString()}');
    });
  }

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              skipButton();
            },
            child: const Text(
              'Skip',
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color(0xFF031956).withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller: pageController,
                itemBuilder: (BuildContext context, int index) {
                  return BuildOnBoardingItem(boarding[index]);
                },
                onPageChanged: (index) {
                  pageIndex = index;
                  print(pageIndex);
                },
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: pageController, // PageController
                  count: boarding.length,
                  effect: ExpandingDotsEffect(activeDotColor: defaultColor), // your preferred effect
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (pageIndex >= boarding.length - 1) {
                      skipButton();
                    } else {
                      pageController.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastOutSlowIn);
                    }
                  },
                  child: const Icon(IconBroken.Arrow___Right),
                )
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

Widget BuildOnBoardingItem(OnBoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image.asset('${model.image}'),
        ),
        const SizedBox(height: 40),
        Text(
          '${model.firstText}',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          '${model.bodyText}',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
