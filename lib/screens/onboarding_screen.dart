import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:onboarding_ui/models/onboardingModel.dart';
import 'package:onboarding_ui/router/router.dart';
import 'package:onboarding_ui/screens/home_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    autoswipe();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool onLastPage = false;
  bool onFirstPage = false;
  bool isFinished = false;
  int pageIndex = 0;

  void autoswipe() {
    Timer(Duration(seconds: 5), () {
      if (pageIndex != 2) {
        _pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.easeIn);
        autoswipe();
      }
    });
  }

  Widget build(BuildContext context) {
    Data info = Data();
    return Scaffold(
      // backgroundColor: Colors.white.withAlpha(2),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          const SizedBox(
            width: 10,
          ),
          onFirstPage
              ? IconButton(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(Routers.homepage.name);
                  },
                  icon: const Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                    size: 30,
                  ))
              : IconButton(
                  onPressed: () {
                    _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 30,
                  )),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.heart_fill,
                color: Colors.white,
                size: 30,
              )),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Expanded(
        flex: 3,
        child: PageView.builder(
            allowImplicitScrolling: false,
            onPageChanged: (value) {
              setState(() {
                onLastPage = (value == 2);
                onFirstPage = (value == 0);
                pageIndex = value;
              });
            },
            controller: _pageController,
            dragStartBehavior: DragStartBehavior.down,
            itemCount: info.list.length,
            physics: ClampingScrollPhysics(),
            pageSnapping: true,
            scrollBehavior: const CupertinoScrollBehavior(),
            itemBuilder: (context, index) {
              var data = info.list[index];
              return Stack(children: [
                SvgPicture.asset(
                  "assets/blurry-gradient-haikei.svg",
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [
                          0.3,
                          0.8
                        ],
                        colors: [
                          Colors.lightBlueAccent.withOpacity(0.7),
                          // Colors.purpleAccent,
                          Colors.purple
                        ]),
                  ),
                  child: SafeArea(
                    child: Center(
                      child: Stack(children: [
                        Positioned(
                            top: 0,
                            right: -20,
                            child: Hero(
                                transitionOnUserGestures: true,
                                tag: "${data.titel}_cube",
                                child: Image.asset("assets/cube.png"))),
                        Positioned(
                            bottom: -30 +
                                (pageIndex ?? 1) * -180 +
                                (pageIndex ?? 2) * 300,
                            left: 10 +
                                (pageIndex ?? 1) * -30 +
                                (pageIndex ?? 2) * -50,
                            child: Hero(
                              tag: "${data.titel}_rightImage",
                              child: RotatedBox(
                                quarterTurns: pageIndex == 0
                                    ? 0
                                    : pageIndex == 1
                                        ? 1
                                        : 4,
                                child: Image.asset(
                                  "assets/ring.png",
                                  height: pageIndex == 0 ? 350 : 250,
                                  opacity: const AlwaysStoppedAnimation(0.5),
                                ),
                              ),
                            )),
                        Positioned(
                          top: 80 +
                              (pageIndex ?? 1) * 0 +
                              (pageIndex ?? 2) * 160,
                          left: -160 +
                              (pageIndex ?? 1) * 300 +
                              (pageIndex ?? 2) * -120,
                          // left: -160,
                          child: Hero(
                            tag: "${data.titel}_leftImage",
                            child: Image.asset(
                              "assets/Clay_Purple0004.png",
                              filterQuality: FilterQuality.high,
                              opacity: const AlwaysStoppedAnimation(0.6),
                              scale: 1,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0, 0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 300,
                                width: 300,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                          blurStyle: BlurStyle.inner,
                                          offset: Offset.zero,
                                          color: Colors.grey,
                                          blurRadius: 30,
                                          spreadRadius: 0)
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(data.image))),
                              ),
                              const Spacer(),
                              Container(
                                height: 380,
                                width: 320,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      tileMode: TileMode.decal,
                                      colors: [
                                        Colors.white.withOpacity(0.3),
                                        Colors.white.withOpacity(0.1),
                                        Colors.white.withOpacity(0.01),
                                        Colors.transparent.withOpacity(0.1),
                                        Colors.transparent.withOpacity(0.04)
                                      ]),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          data.titel,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 35),
                                        ),
                                        const Spacer(),
                                        Text(
                                          data.desc,
                                          style: const TextStyle(
                                              color: Colors.white70,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const Spacer(),
                                        onLastPage
                                            ?
                                            // SwipeableButtonView(
                                            //     buttonText: 'Slide to Pay',
                                            //     buttontextstyle:
                                            //         const TextStyle(
                                            //             fontSize: 25,
                                            //             color: Colors.white),
                                            //     buttonWidget: const Icon(
                                            //         Icons
                                            //             .arrow_forward_ios_rounded,
                                            //         color: Colors.grey),
                                            //     activeColor:
                                            //         const Color(0xFF009C41),
                                            //     onWaitingProcess: () {
                                            //       // - - -
                                            //       // Amount of time the circular progress
                                            //       // indicator spins before navigating to next page
                                            //       //- - -
                                            //       Future.delayed(
                                            //           const Duration(
                                            //               seconds: 2),
                                            //           () => setState(() =>
                                            //               isFinished = true));
                                            //     },
                                            //     isFinished: isFinished,
                                            //     onFinish: () async {
                                            //       // - - - Navigate to confirmation page - - -
                                            //       await Navigator.push(
                                            //           context,
                                            //           PageTransition(
                                            //               type:
                                            //                   PageTransitionType
                                            //                       .fade,
                                            //               child:
                                            //                   const HomePage()));
                                            //       // - - - Reset isFinished variable  - - -
                                            //       setState(
                                            //           () => isFinished = false);
                                            //     },
                                            //   )
                                            Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: const Color(
                                                        0xFF844FFC)),
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          PageTransition(
                                                              child:
                                                                  const HomePage(),
                                                              type:
                                                                  PageTransitionType
                                                                      .fade));
                                                      // GoRouter.of(context)
                                                      //     .pushNamed(Routers
                                                      //         .homepage.name);
                                                    },
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            const MaterialStatePropertyAll(
                                                                Colors
                                                                    .transparent),
                                                        alignment:
                                                            Alignment.center,
                                                        padding:
                                                            const MaterialStatePropertyAll(
                                                                EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        85,
                                                                    vertical:
                                                                        20)),
                                                        shape: MaterialStatePropertyAll(
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)))),
                                                    child: const Text(
                                                      "Get Started",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                    )),
                                              )
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          _pageController
                                                              .jumpToPage(
                                                            2,
                                                          );
                                                        });
                                                      },
                                                      child: const Text(
                                                        "Skip",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      )),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          _pageController.nextPage(
                                                              duration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          300),
                                                              curve: Curves
                                                                  .easeIn);
                                                        });
                                                      },
                                                      child: const Text(
                                                        "Next",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18),
                                                      ),
                                                      style: ButtonStyle(
                                                          shape:
                                                              MaterialStatePropertyAll(
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                          ),
                                                          padding:
                                                              const MaterialStatePropertyAll(
                                                                  EdgeInsets.only(
                                                                      top: 20,
                                                                      bottom:
                                                                          20,
                                                                      right: 30,
                                                                      left:
                                                                          30)))),
                                                ],
                                              ),
                                        const Spacer(),
                                        Row(
                                          children: [
                                            const Spacer(),
                                            ...List.generate(
                                                info.list.length,
                                                (index) => Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 12),
                                                      child: DotIndicator(
                                                        isActive:
                                                            index == pageIndex,
                                                      ),
                                                    )),
                                            const Spacer(),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer()
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ]);
            }),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  final bool isActive;
  DotIndicator({
    this.isActive = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 12,
      width: 12,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.grey, shape: BoxShape.circle),
    );
  }
}
