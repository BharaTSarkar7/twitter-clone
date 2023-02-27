import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_clone/constants/assets_path_constant.dart';
import 'package:twitter_clone/utils/theme.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.twitterLogo,
        colorFilter:
            const ColorFilter.mode(AppColors.blueColor, BlendMode.srcIn),
        height: 30,
      ),
      centerTitle: true,
    );
  }

  static List<Widget> bottomTabBarScreens = [
    const Text('feed Screen'),
    const Text('Search Screen'),
    const Text('Notification Screen'),
  ];
}
