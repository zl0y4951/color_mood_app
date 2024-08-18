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

  Widget _moodToWidget((int ind, MoodEnum mood) record) => MoodBoxWidget(
        size: 70,
        color: record.$2.color,
        borderWidth: 3,
        onTap: () => setState(() {
          current = record.$1;
        }),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (_) => TodayBloc()..add(const TodayLoadEvent()),
        child: BlocBuilder<TodayBloc, TodayState>(
          builder: (context, state) {
            // if (state is TodayIdleState) {
            //   if (state.current != null) {
            //     current = state.current!.moodCondition - 1;
            //   }
            // }
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
                  color:
                      current != null ? MoodEnum.values[current!].color : null,
                ),
                const SizedBox(height: 144),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: MoodEnum.values.indexed
                      .map(_moodToWidget)
                      .toList(growable: false),
                ),
                const SizedBox(height: 72),
                CustomButton(
                  text: state is TodayIdleState && state.current != null
                      ? 'Изменить'
                      : 'Добавить',
                  padding: const EdgeInsets.symmetric(horizontal: 42),
                  onPressed: current == null
                      ? null
                      : () {
                          context.read<TodayBloc>().add(
                                TodayChooseMoodEvent(
                                  MoodEntity(
                                    moodCondition: current! + 1,
                                    datetime: DateTime.now().getDay,
                                  ),
                                ),
                              );
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
