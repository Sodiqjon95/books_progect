import 'package:books_progect/utils/constants.dart';
import 'package:books_progect/utils/icons.dart';
import 'package:flutter/material.dart';

import '../../utils/color.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Image.asset(
        MyIcons.categ,fit: BoxFit.fill,
        // width: 40,
        height: MediaQuery.of(context).size.height,
        // color: MyColors.primaryColor,
      ),
    );
  }

  Future<void> _init() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, booksPage);
    });
  }
}