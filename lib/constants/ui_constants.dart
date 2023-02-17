import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_clone/constants/assets_path_constant.dart';
import 'package:twitter_clone/utils/theme.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.twitterLogo,
        color: AppColors.blueColor,
        height: 30,
      ),
      centerTitle: true,
    );
  }
}
