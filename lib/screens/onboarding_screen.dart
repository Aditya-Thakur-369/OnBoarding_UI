// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:onboarding_ui/models/onboardingModel.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Data info = Data();
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            const SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.close_rounded,
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
          elevation: 0,
        ),
        body: PageView.builder(
            allowImplicitScrolling: false,
            physics: AlwaysScrollableScrollPhysics(),
            controller: _pageController,
            itemCount: info.list.length,
            itemBuilder: (context, index) {
              var data = info.list[index];
              return OnBoardingComponent(
                title: data.titel,
                desc: data.desc,
                image: data.image,
              );
            }));
  }
}

class OnBoardingComponent extends StatefulWidget {
  String title, desc, image;
  OnBoardingComponent({
    required this.title,
    required this.desc,
    required this.image,
    super.key,
  });

  @override
  State<OnBoardingComponent> createState() => _OnBoardingComponentState();
}

class _OnBoardingComponentState extends State<OnBoardingComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.3, 0.8],
              colors: [Colors.blue.withOpacity(0.6), Colors.purple])),
      child: SafeArea(
        child: Center(
          child: Stack(children: [
            Positioned(
                top: -20, right: -10, child: Image.asset("assets/cube.png")),
            Positioned(
                bottom: -30,
                right: -70,
                child: Image.asset(
                  "assets/ring.png",
                  opacity: const AlwaysStoppedAnimation(0.5),
                )),
            Positioned(
                top: 80,
                left: -160,
                child: Image.asset(
                  "assets/Clay_Purple0004.png",
                  filterQuality: FilterQuality.high,
                  opacity: const AlwaysStoppedAnimation(0.6),
                  scale: 1,
                )),
            Align(
              alignment: const Alignment(0, 0),
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset.zero,
                              color: Colors.grey,
                              blurRadius: 30,
                              spreadRadius: 0)
                        ],
                        shape: BoxShape.circle,
                        image:
                            DecorationImage(image: AssetImage(widget.image))),
                  ),
                  const Spacer(),
                  Container(
                    height: 380,
                    width: 320,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.transparent.withOpacity(0.2)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              widget.title,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35),
                            ),
                            const Spacer(),
                            Text(
                              widget.desc,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Skip",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    )),
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    child: const Text(
                                      "Next",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                    style: ButtonStyle(
                                        shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                        padding: const MaterialStatePropertyAll(
                                            EdgeInsets.only(
                                                top: 20,
                                                bottom: 20,
                                                right: 30,
                                                left: 30)))),
                              ],
                            ),
                            const Spacer(),
                            AnimatedContainer(
                              height: 10,
                              width: 10,
                              duration: const Duration(milliseconds: 300),
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
    );
  }
}
