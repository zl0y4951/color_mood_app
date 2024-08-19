import 'package:color_mood_app/src/core/extensions/extended_iterable.dart';
import 'package:color_mood_app/src/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  static const _days = [
    'пн',
    'вт',
    'ср',
    'чт',
    'пт',
    'сб',
    'вс',
  ];

  static const _month = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 54),
          Center(
            child: Text(
              'Такова общая картина:',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _days
                  .map(
                    (day) => Text(day),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 12),
          Flexible(
            child: ColoredBox(
                color: CustomColors.grey,
                child: Center(
                  child: Text('Страница все еще в разработке🐈'),
                )
                // ListView(
                //   children: [Text(DateTime.now().weekday.toString())],
                // ),
                ),
          ),
        ],
      ),
    );
  }
}
