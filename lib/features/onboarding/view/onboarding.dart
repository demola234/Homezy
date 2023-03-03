import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homezy/core/cache/app_cache.dart';
import 'package:homezy/core/global/constants/size.dart';
import 'package:homezy/core/global/model/onboarding_model.dart';
import 'package:homezy/core/routes/routes_constants.dart';
import 'package:homezy/features/onboarding/widgets/onboarding_background.dart';
import 'package:homezy/locator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  final cache = sl<AppCache>();

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _skipToLastPage() {
    setState(() => _pageController.jumpToPage(2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const OnboardingBackground(),
          Expanded(
            child: PageView.builder(
              itemCount: onboarding.length,
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          onboarding[index].text,
                          style: Config.h1(context).copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 37,
                          ),
                        ),
                      ),
                    ),
                    const VerticalMargin(40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        onboarding[index].desc,
                        style: Config.h1(context).copyWith(
                          color: Theme.of(context).cardColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 90, right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 10,
                  child: ListView.builder(
                    itemCount: onboarding.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 3,
                            ),
                            width: 45,
                            height: 1.5,
                            decoration: BoxDecoration(
                              color: currentIndex == index
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (currentIndex != 2) {
                      _skipToLastPage();
                    } else {
                      context.pushNamed(RouteConstants.welcome);
                      cache.saveOnboarding(true);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(currentIndex != 2 ? "Skip" : "Continue",
                          style: Config.b3(context).copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
