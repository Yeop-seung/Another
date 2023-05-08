import 'package:another/constant/color.dart';
import 'package:another/constant/text_style.dart';
import 'package:another/widgets/go_back_appbar_style.dart';
import 'package:flutter/material.dart';

import 'widgets/image_profile.dart';

class ChallengeList extends StatelessWidget {
  const ChallengeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GoBackAppBarStyle(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '함께달린 사람',
                  style: MyTextStyle.twentyFiveTextStyle,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  '25',
                  style: MyTextStyle.twentyFiveTextStyle,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ImageProfile(radius: 35.0, profileFontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}