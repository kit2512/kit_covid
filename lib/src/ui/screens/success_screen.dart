import 'package:covid_repository/covid_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/widgets.dart';
import '../theme/theme.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    Key? key,
    required this.country,
  }) : super(key: key);
  final Country country;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(23.sp).copyWith(top: 10.h),
      children: [
        _buildHeader(context),
        SizedBox(height: 14.h),
        _buildChoices(),
        SizedBox(height: 14.h),
        _buildStatsCards(context),
        SizedBox(height: 20.h),
        _buildChart(context)
      ],
    );
  }

  Widget _buildChart(BuildContext context) {
    if (country.historical == null) {
      return const Text("Unable to load data");
    } else {
      final timeline = country.historical!.timeline;
      final dataMap = {
        "Cases": timeline!.cases,
        "Deaths": timeline.deaths,
      };
      return TimeLineChart(dataMap: dataMap);
    }
  }

  Widget _buildStatsCards(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LargeStatsCard(
              title: "Confirmed",
              number: country.cases,
            ),
            LargeStatsCard(
              title: "Deaths",
              number: country.deaths,
              backgroundColor: kSecondaryColor,
            ),
          ],
        ),
        SizedBox(
          height: 18.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmallStatsCard(title: "Recoverd", number: country.recovered),
            SmallStatsCard(
              title: "Active",
              number: country.active,
            ),
            SmallStatsCard(
              title: "Critical",
              number: country.critical,
            ),
          ],
        ),
      ],
    );
  }

  Wrap _buildChoices() {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 16.w,
      children: [
        ChoiceChip(
          label: const Text("Today"),
          selected: true,
          onSelected: (select) {},
        ),
        ChoiceChip(
          label: const Text("Yesterday"),
          selected: false,
          onSelected: (select) {},
        ),
        ChoiceChip(
          label: const Text("All"),
          selected: false,
          onSelected: (select) {},
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              country.country,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              "Covid-19 statistics",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w200,
                    color: kPrimaryLightColor,
                  ),
            ),
          ],
        ),
        Container(
          width: 84.w,
          height: 56.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            image: DecorationImage(
                image: NetworkImage(country.flag), fit: BoxFit.cover),
          ),
        )
      ],
    );
  }
}
