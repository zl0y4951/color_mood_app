import 'package:color_mood_app/src/core/extensions/date_time.dart';
import 'package:color_mood_app/src/core/models/mood/mood.dart';
import 'package:color_mood_app/src/core/models/mood/mood_enum.dart';
import 'package:color_mood_app/src/core/widgets/custom_button.dart';
import 'package:color_mood_app/src/core/widgets/mood_box_widget.dart';
import 'package:color_mood_app/src/feature/today/bloc/today_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  int? current;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (_) => TodayBloc()..add(const TodayLoadEvent()),
        child: BlocBuilder<TodayBloc, TodayState>(
          builder: (context, state) {
            if (current == null && state.current != null) {
              current = state.current!.moodCondition;
            }
            return Column(
              children: [
                const SizedBox(height: 54),
                Center(
                    child: Text(
                  'Какой колорный муд дня?',
                  style: Theme.of(context).textTheme.headlineLarge,
                )),
                const SizedBox(height: 36),
                MoodBoxWidget(
                  size: 200,
                  color: state.current != null
                      ? MoodEnum.values[state.current!.moodCondition].color
                      : null,
                ),
                const SizedBox(height: 144),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: MoodEnum.values.indexed.map(
                      (record) {
                        return MoodBoxWidget(
                            size: 70,
                            color: record.$2.color,
                            isOpacity: record.$1 != current,
                            borderWidth: 3,
                            onTap: () => setState(() {
                                  current = record.$1;
                                }));
                      },
                    ).toList(growable: false)),
                const SizedBox(height: 48),
                CustomButton(
                  text: state.current != null ? 'Изменить' : 'Добавить',
                  padding: const EdgeInsets.symmetric(horizontal: 42),
                  onPressed: current == null
                      ? null
                      : () {
                          context.read<TodayBloc>().add(TodayChooseMoodEvent(
                              MoodEntity(
                                  datetime: DateTime.now()
                                          .getDay
                                          .millisecondsSinceEpoch ~/
                                      1000,
                                  moodCondition: current!)));
                        },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
