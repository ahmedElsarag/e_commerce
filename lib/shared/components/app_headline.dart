import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../src/app_color.dart';

class AppHeadline extends StatelessWidget {
  const AppHeadline({Key? key,  this.withLeading = true, required this.title}) : super(key: key);

  final bool withLeading;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            Visibility(
              visible: withLeading,
              child: Text(
                'View All',
                style: TextStyle(
                    color: AppColors.lightGrey,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ));
  }
}
