import 'package:kit_covid/src/blocs/blocs.dart';
import 'package:kit_covid/src/ui/theme/theme.dart';
import 'package:kit_covid/src/ui/widgets/widgets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBarChart extends StatelessWidget {
  final Map<dynamic, int> mapData;
  final String Function(dynamic) getTitles;
  const MyBarChart({
    Key? key,
    required this.mapData,
    required this.getTitles,
  }) : super(key: key);

  double _max(Map<dynamic, int> mapData) {
    final values = mapData.values.toList();
    values.sort((a, b) => a - b);
    final max = values.last * 1.25;
    return max;
  }

  String formatNumber(double number) {
    if (mapData.entries.length > 10) {
      return "";
    } else
      return number.formatNumber;
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData(context),
        barGroups: barGroups,
        borderData: borderData,
        alignment: BarChartAlignment.spaceAround,
        maxY: _max(mapData),
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: const EdgeInsets.all(0),
          tooltipMargin: 0,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              formatNumber(rod.y),
              TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w200,
                fontSize: 10.sp,
              ),
            );
          },
        ),
      );

  FlTitlesData titlesData(BuildContext context) => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) =>
              Theme.of(context).textTheme.caption!.copyWith(
                    fontWeight: FontWeight.w200,
                  ),
          getTitles: (value) {
            final int index = value.toInt();
            if (mapData.entries.length >= 10) {
              if (index % 5 == 0) {
                return getTitles(mapData.keys.toList()[index]);
              }
              return "";
            }
            return getTitles(mapData.keys.toList()[index]);
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, _) => TextStyle(
            fontSize: 9.sp,
            color: kPrimaryLightColor,
          ),
        ),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups {
    final values = mapData.values.toList();
    final data = <BarChartGroupData>[];
    final length = values.length;
    try {
      for (int i = 0; i < length; i++) {
        data.add(
          BarChartGroupData(
            x: i,
            barRods: [
              BarChartRodData(
                  y: values[i].toDouble(),
                  colors: [i == length - 1 ? kSecondaryColor : kPrimaryColor],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.sp),
                      topRight: Radius.circular(4.sp)))
            ],
            showingTooltipIndicators: [0],
          ),
        );
      }
    } catch (e) {
      rethrow;
    }
    return data;
  }
}

class TimeLineChart extends StatefulWidget {
  const TimeLineChart({Key? key, required this.dataMap}) : super(key: key);

  final Map<String, dynamic> dataMap;
  @override
  State<TimeLineChart> createState() => _TimeLineChartState();
}

class _TimeLineChartState extends State<TimeLineChart> {
  late Map<DateTime, int> _selectedData;

  @override
  void initState() {
    _selectedData = widget.dataMap.values.first;
    super.initState();
  }

  void onSelected(dynamic value) {
    setState(() {
      _selectedData = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Analytics",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            PopupButton(
              valuesMap: widget.dataMap,
              onSelected: onSelected,
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          height: 280.h,
          child: BlocConsumer<CountryCubit, CountryState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(10.sp).copyWith(top: 23.h),
                clipBehavior: Clip.antiAlias,
                child: state.country.historical == null
                    ? const Text("Unable to load data")
                    : MyBarChart(
                        mapData: _selectedData,
                        getTitles: (value) {
                          final DateTime dt = value as DateTime;
                          return "${dt.day}/${dt.month}";
                        },
                      ),
              );
            },
          ),
        ),
      ],
    );
  }
}
