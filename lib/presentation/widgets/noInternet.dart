import 'package:flutter/material.dart';

import '../../constrains/colors.dart';

Widget buildNoInternetWidget() {
  return Center(
    child: Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Can\'t connect .. check internet',
            style: TextStyle(
              fontSize: 22,
              color: MyColors.myGrey,
            ),
          ),
          Image.asset('assets/images/undraw_Warning_re_eoyh.png')
        ],
      ),
    ),
  );
}