import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freelance_salary_helper_app/models/france_data.dart';
import 'package:freelance_salary_helper_app/ui/pages/loading_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final tjmProvider = StateProvider<int>((ref) => 0);
const int maxTjm = 1000;
final workdayPerYearProvider = StateProvider<int>((ref) => 217);
const int maxWorkDayPerYear = 365;
final rateSavedPerMonthProvider = StateProvider<double>((ref) => 0.15);

final endOfYearCompanyBalanceProvider = Computed<double>((read) {
  final tjm = read(tjmProvider).state;
  final workdayPerYear = read(workdayPerYearProvider).state;
  final FranceData franceData = read(franceDataStateProvider).state;
  final rateSavedPerMonth = read(rateSavedPerMonthProvider).state;

  var yearlyRevenus = tjm * workdayPerYear;
  var perMonthInitial = yearlyRevenus / 12;
  var perMonthAfterTva = perMonthInitial * (1 - franceData.tvaRate);
  var perMonthSaving = perMonthAfterTva * (rateSavedPerMonth);

  return perMonthSaving * 12;
});

final realSalaryPerMonthProvider = Computed<double>((read) {
  final rateSavedPerMonth = read(rateSavedPerMonthProvider).state;
  final FranceData franceData = read(franceDataStateProvider).state;
  final tjm = read(tjmProvider).state;
  final workdayPerYear = read(workdayPerYearProvider).state;

  var yearlyRevenus = tjm * workdayPerYear;
  var perMonthInitial = yearlyRevenus / 12;
  var perMonthAfterTva = perMonthInitial * (1 - franceData.tvaRate);
  var perMonthAfterSaving = perMonthAfterTva * (1 - rateSavedPerMonth);
  var perMontAfterPatronalAndSalarialCharges = perMonthAfterSaving *
      (1 -
          (franceData.chargesRatronalesRate +
              franceData.chargesSalarialesRate));

  return perMontAfterPatronalAndSalarialCharges;
});

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final tjm = useProvider(tjmProvider);
    final workdayPerYear = useProvider(workdayPerYearProvider);
    final rateSavedPerMonth = useProvider(rateSavedPerMonthProvider);
    final double endOfYearCompanyBalance =
        useProvider(endOfYearCompanyBalanceProvider);
    final double realSalaryPerMonth = useProvider(realSalaryPerMonthProvider);
    return SafeArea(
      child: Container(
        child: GridView.count(
          childAspectRatio: 5,
          crossAxisCount: 1,
          children: <Widget>[
            ..._tjmRow(tjm),
            ..._workDaysRow(workdayPerYear),
            ..._rateSavedPerMonthRow(rateSavedPerMonth),
            ..._endOfYearCompanyBalanceRow(endOfYearCompanyBalance),
            ..._realSalaryPerMonthRow(realSalaryPerMonth),
          ],
        ),
      ),
    );
  }

  List<Widget> _tjmRow(StateController<int> tjm) => [
        Align(alignment: Alignment.bottomLeft, child: Text('TJM souhaité: ')),
        CupertinoPicker(
            itemExtent: 50,
            onSelectedItemChanged: (value) => tjm.state = value,
            children: List.generate(
                1000, (index) => _cupertinoPickerChild('$index€'))),
      ];

  Widget _cupertinoPickerChild(String text) => SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            border: Border.symmetric(
              vertical:
                  BorderSide(width: 0.5, color: Colors.grey.withOpacity(0.2)),
            ),
          ),
          child: Center(child: Text(text)),
        ),
      );

  List<Widget> _workDaysRow(StateController<int> workdayPerYear) => [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text('Nombre de jours travaillés par an: '),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(workdayPerYear.state.toString()),
            Slider(
                min: 0,
                max: maxWorkDayPerYear.roundToDouble(),
                value: workdayPerYear.state.roundToDouble(),
                onChanged: (value) => workdayPerYear.state = value.round())
          ],
        ),
      ];

  List<Widget> _rateSavedPerMonthRow(
          StateController<double> rateSavedPerMonth) =>
      [
        Align(
          alignment: Alignment.bottomLeft,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
                'Pourcentage à laisser sur le compte entreprise à la fin du mois: '),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${(rateSavedPerMonth.state * 100).toStringAsFixed(2)}%'),
            Slider(
                min: 0,
                max: 1,
                value: rateSavedPerMonth.state,
                onChanged: (value) => rateSavedPerMonth.state = value)
          ],
        ),
      ];

  List<Widget> _endOfYearCompanyBalanceRow(
    double endOffYearBalance,
  ) =>
      [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text("Argen sur le compte entreprise à la fin de l'année"),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text('${endOffYearBalance.toStringAsFixed(2)} €'),
        ),
      ];

  List<Widget> _realSalaryPerMonthRow(
    double realSalaryPerMonth,
  ) =>
      [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text('Gain net par mois'),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text('${realSalaryPerMonth.toStringAsFixed(2)} €'),
        ),
      ];
}
