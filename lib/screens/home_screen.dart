import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const CupertinoIconThemeData(color: Colors.white, size: 30),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.heart_fill,
                color: Colors.white,
              ))
        ],
      ),
      backgroundColor: const Color(0xFF844FFC),
      body: const SafeArea(
          child: SafeArea(
              child: Center(
        child: Text(
          "Home Page ",
          style: TextStyle(
              fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ))),
    );
  }
}
