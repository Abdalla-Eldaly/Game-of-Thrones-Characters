import 'package:flutter/material.dart';

import '../../constrains/colors.dart';

Widget characterInfo(String title, String value) {
  return RichText(
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    text: TextSpan(
      children: [
        TextSpan(
          text: title,
          style: TextStyle(
            color: MyColors.myWhite,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        TextSpan(
          text: value,
          style: TextStyle(
            color: MyColors.myWhite,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}
Widget buildDivider(double endIndent) {
  return Divider(
    height: 30,
    endIndent: endIndent,
    color: MyColors.myYellow,
    thickness: 2,
  );
}
