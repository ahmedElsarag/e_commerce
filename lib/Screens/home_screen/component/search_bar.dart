import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../src/app_color.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        maxLines: 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.darkWhite,
          hintText: 'Search',
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(
              'assets/svg/search.svg',
              height: 20,
              width: 20,
              color: Colors.grey,
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'assets/svg/filter.svg',
              height: 20,
              width: 20,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
