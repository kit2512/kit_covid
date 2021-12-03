import 'package:kit_covid/src/blocs/blocs.dart';
import 'package:kit_covid/src/ui/screens/empty_screen.dart';
import 'package:kit_covid/src/ui/screens/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/widgets.dart';
import 'search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocBuilder<CountryCubit, CountryState>(
        bloc: context.read<CountryCubit>(),
        builder: (_, state) {
          switch (state.status) {
            case CountryStatus.initial:
              return const EmptyScreen();
            case CountryStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case CountryStatus.success:
              return SuccessScreen(country: state.country);
            case CountryStatus.failure:
              return const Center(child: Text("Error loading country"));
          }
        },
      ),
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: "Covid-19 Statistics",
      leading: AppBarIconButton(
        child: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {
          // TODO: Handle open menu
        },
      ),
      trailing: AppBarIconButton(
        child: const Icon(Icons.search_rounded),
        onPressed: () async {
          final countryName =
              await Navigator.push(context, SearchScreen.pageRoute(context));
          context.read<CountryCubit>().fetchCountry(countryName);
        },
      ),
    );
  }
}
