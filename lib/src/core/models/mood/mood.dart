import 'package:color_mood_app/src/core/database/database_impl.dart';
import 'package:drift/drift.dart';

class MoodEntity {
  final int moodCondition;
  final DateTime datetime;

  const MoodEntity({required this.moodCondition, required this.datetime});

  factory MoodEntity.fromEntry(Mood table) {
    return MoodEntity(
      moodCondition: table.moodCondition,
      datetime: table.datetime,
    );
  }

  MoodTableCompanion toCompanion() => MoodTableCompanion(
      datetime: Value(datetime), moodCondition: Value(moodCondition));
}
