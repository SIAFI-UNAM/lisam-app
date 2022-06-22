import 'package:flutter/material.dart';
import 'package:lisam_app/constans/colors.dart';
import 'package:lisam_app/pages/started/screens/continue.screen.dart';
import 'package:lisam_app/pages/started/screens/lisam_info.screen.dart';
import 'package:lisam_app/pages/started/screens/lisam_logo.screen.dart';
import 'package:lisam_app/widgets/slideshow.widget.dart';

class StartedPage extends StatelessWidget {
  const StartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const pages = [LisamLogoScreen(), LisamInfoScreen(), ContinueScreen()];

    return const Scaffold(
        backgroundColor: mainColor,
        body: SlideShow(
          slides: pages,
          primaryColor: Colors.pink,
        ));
  }
}
