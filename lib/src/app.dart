import 'package:kit_covid/src/blocs/blocs.dart';
import 'package:kit_covid/src/ui/theme/theme.dart';
import 'package:covid_repository/covid_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ui/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidApp extends StatelessWidget {
  const CovidApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390.0, 844.0),
      builder: () => BlocProvider(
        create: (_) => CountryCubit(CovidRepository(null)),
        child: MaterialApp(
          theme: CovidAppTheme.lightTheme(),
          home: HomeScreen(),
        ),
      ),
    );
  }
}
