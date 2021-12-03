import 'package:kit_covid/src/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/widgets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  static MaterialPageRoute pageRoute(BuildContext context) {
    return MaterialPageRoute(builder: (context) {
      return SearchScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _searchController = TextEditingController();
    return Scaffold(
      appBar: CustomAppBar(
        title: "Search Country",
        leading: AppBarIconButton(
          child: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            const Text("Find any country you want to get statistics"),
            SizedBox(
              height: 20.h,
            ),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search here",
                suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: kPrimaryColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context, _searchController.text);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
