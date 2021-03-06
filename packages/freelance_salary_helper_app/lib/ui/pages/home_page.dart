import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freelance_salary_helper_app/models/france_data.dart';
import 'package:freelance_salary_helper_app/ui/pages/loading_page.dart';
import 'package:freelance_salary_helper_app/ui/themes/text_styles.dart';
import 'package:freelance_salary_helper_app/ui/widgets/cupertino_number_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final tjmProvider = StateProvider<int>((ref) => initialTjm);
const int minTjm = 0;
const int maxTjm = 9999;
const int initialTjm = 450;
final workdayPerYearProvider = StateProvider<int>((ref) => 210);
const int maxWorkDayPerYear = 365;
final rateSavedPerMonthProvider = StateProvider<double>((ref) => 0.15);

final endOfYearCompanyBalanceProvider = Computed<double>((read) {
  final tjm = read(tjmProvider).state;
  final workdayPerYear = read(workdayPerYearProvider).state;
  final FranceData franceData = read(franceDataStateProvider).state;
  final rateSavedPerMonth = read(rateSavedPerMonthProvider).state;

  var yearlyRevenus = tjm * workdayPerYear;
  var endOffYearBalance = yearlyRevenus * (rateSavedPerMonth);
  var endOffYearBalanceAfterIs =
      endOffYearBalance < franceData.taxesOnCompany.first.limit
          ? endOffYearBalance * (1 - franceData.taxesOnCompany.first.rate)
          : endOffYearBalance * (1 - franceData.taxesOnCompany[1].rate);

  return endOffYearBalanceAfterIs;
});

final realSalaryPerMonthProvider = Computed<double>((read) {
  final rateSavedPerMonth = read(rateSavedPerMonthProvider).state;
  final FranceData franceData = read(franceDataStateProvider).state;
  final tjm = read(tjmProvider).state;
  final workdayPerYear = read(workdayPerYearProvider).state;

  var yearlyRevenus = tjm * workdayPerYear;
  var perMonth = yearlyRevenus / 12;
  var perMonthAfterSaving = perMonth * (1 - rateSavedPerMonth);
  var perMontAfterPatronalAndSalarialCharges = perMonthAfterSaving *
      (1 -
          (franceData.chargesRatronalesRate +
              franceData.chargesSalarialesRate));

  return perMontAfterPatronalAndSalarialCharges;
});

final yearTotalRevenueAfterTaxesProvider = Computed<double>((read) {
  final endOfYearBalance = read(endOfYearCompanyBalanceProvider);
  final FranceData franceData = read(franceDataStateProvider).state;
  final realSalaryPerMonth = read(realSalaryPerMonthProvider);

  return 12 * realSalaryPerMonth +
      (1 - franceData.dividendRate) * endOfYearBalance;
});

class HomePage extends HookWidget {
  final f = NumberFormat(',###', "zz");

  @override
  Widget build(BuildContext context) {
    final tjm = useProvider(tjmProvider);
    final workdayPerYear = useProvider(workdayPerYearProvider);
    final rateSavedPerMonth = useProvider(rateSavedPerMonthProvider);
    final double endOfYearCompanyBalance =
        useProvider(endOfYearCompanyBalanceProvider);
    final double realSalaryPerMonth = useProvider(realSalaryPerMonthProvider);
    final double yearTotalRevenueAfterTaxes =
        useProvider(yearTotalRevenueAfterTaxesProvider);
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 30, left: 15, right: 15),
        child: ListView(
          children: <Widget>[
            _tjmRow(tjm),
            SizedBox(height: 40),
            ..._workDaysRow(workdayPerYear),
            SizedBox(height: 40),
            ..._rateSavedPerMonthRow(rateSavedPerMonth),
            SizedBox(height: 40),
            _endOfYearCompanyBalanceRow(endOfYearCompanyBalance),
            SizedBox(height: 40),
            _realSalaryPerMonthRow(realSalaryPerMonth),
            SizedBox(height: 40),
            _yearTotalRevenueAfterTaxes(yearTotalRevenueAfterTaxes),
          ],
        ),
      ),
    );
  }

  Widget _tjmRow(StateController<int> tjm) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('TJM: '),
          CupertinoNumberPicker(
            textStyle: TextStyles.important,
            itemExtent: 50,
            min: minTjm,
            max: maxTjm,
            initialVallue: initialTjm,
            onValueChanged: (value) => tjm.state = value,
          ),
          SizedBox(width: 5),
          Text('HT'),
        ],
      );

  List<Widget> _workDaysRow(StateController<int> workdayPerYear) => [
        RichText(
            text: TextSpan(
                text: 'Work days per year: ',
                style: TextStyles.defaultText,
                children: [
              TextSpan(
                text: workdayPerYear.state.toString(),
                style: TextStyles.important,
              ),
            ])),
        Slider(
          min: 0,
          max: maxWorkDayPerYear.roundToDouble(),
          value: workdayPerYear.state.roundToDouble(),
          onChanged: (value) => workdayPerYear.state = value.round(),
        ),
      ];

  List<Widget> _rateSavedPerMonthRow(
          StateController<double> rateSavedPerMonth) =>
      [
        RichText(
          text: TextSpan(
            text: 'Percent to keep on company account: ',
            style: TextStyles.defaultText,
            children: [
              TextSpan(
                  text: '${f.format((rateSavedPerMonth.state * 100))}%',
                  style: TextStyles.important),
            ],
          ),
        ),
        Slider(
            min: 0,
            max: 1,
            divisions: 100,
            value: rateSavedPerMonth.state,
            onChanged: (value) => rateSavedPerMonth.state = value)
      ];

  Widget _endOfYearCompanyBalanceRow(
    double endOffYearBalance,
  ) =>
      RichText(
        text: TextSpan(
          text:
              "Cash on company account at the end of the year (after taxes on society): ",
          style: TextStyles.defaultText,
          children: [
            TextSpan(
              text: '${f.format(endOffYearBalance)} €',
              style: TextStyles.important,
            )
          ],
        ),
      );

  Widget _yearTotalRevenueAfterTaxes(
    double yearTotalRevenueAfterTaxes,
  ) =>
      RichText(
        text: TextSpan(
          text:
              "Total gain after taxes per year (after dividend taxes + full cashout): ",
          style: TextStyles.defaultText,
          children: [
            TextSpan(
              text: '${f.format(yearTotalRevenueAfterTaxes)} €',
              style: TextStyles.important,
            )
          ],
        ),
      );

  Widget _realSalaryPerMonthRow(
    double realSalaryPerMonth,
  ) =>
      RichText(
        text: TextSpan(
          text: 'Total gain per months after taxes: ',
          style: TextStyles.defaultText,
          children: [
            TextSpan(
              text: '${f.format(realSalaryPerMonth)} €',
              style: TextStyles.important,
            ),
          ],
        ),
      );
}
