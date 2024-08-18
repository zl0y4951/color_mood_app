import 'package:color_mood_app/src/core/models/mood/mood_enum.dart';
import 'package:color_mood_app/src/core/widgets/custom_button.dart';
import 'package:color_mood_app/src/core/widgets/mood_box_widget.dart';
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
        create: (_)=>,
        child: BlocBuilder(
          builder: (context,state) {
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
                  color: current != null ? MoodEnum.values[current!].color : null,
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
                  text: 'Добавить',
                  padding: const EdgeInsets.symmetric(horizontal: 42),
                  onPressed: () {},
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
