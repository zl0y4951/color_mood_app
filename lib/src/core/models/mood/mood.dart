import 'package:drift/drift.dart';

import 'package:color_mood_app/src/core/database/database_impl.dart';

class MoodEntity {
  final int moodCondition;
  final int datetime;

  const MoodEntity({required this.moodCondition, required this.datetime});

  factory MoodEntity.fromEntry(Mood table) {
    return MoodEntity(
      moodCondition: table.moodCondition,
      datetime: table.datetime,
    );
  }

  MoodTableCompanion toCompanion() => MoodTableCompanion(
      datetime: Value(datetime), moodCondition: Value(moodCondition));

  @override
  String toString() =>
      'MoodEntity(moodCondition: $moodCondition, datetime: $datetime)';
}
