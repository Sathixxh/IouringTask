import 'package:flutter/material.dart';
import 'package:iouringtask/Features/WatchListMain/Presentation/commonwidgets/textfiled.dart';
import 'package:iouringtask/core/Themes/stylecolors.dart';


class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 25,
          centerTitle: true,
          title: CustomTextformfield(
              onTap: () {},
              hintText: 'Search & Add',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    size: 18,
                    Icons.apps_rounded,
                    color: ColorsPallete.darkmode_secondaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    size: 18,
                    Icons.settings_input_composite_rounded,
                    color: ColorsPallete.darkmode_secondaryColor,
                  ),
                  SizedBox(
                    width: 15,
                  )
                ],
              )),
        ),
        body: Center(
          child: Text(
            "data Not Found",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}