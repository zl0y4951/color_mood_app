import 'package:color_mood_app/src/core/database/database.dart';
import 'package:color_mood_app/src/core/models/mood/mood.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database_impl.g.dart';

@DataClassName('Mood')
class MoodTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get moodCondition => integer()();
  IntColumn get datetime => integer().unique()();
}

@DriftDatabase(tables: [MoodTable])
class Database extends _$Database implements IDatabase {
  Database([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  Future<MoodEntity?> getMood(int id) async {
    final mood = await (select(moodTable)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
    if (mood == null) return null;
    return MoodEntity.fromEntry(mood);
  }

  @override
  Future<MoodEntity?> getCurrentMood(int date) async {
    final mood = await (select(moodTable)
          ..where((tbl) => tbl.datetime.equals(date)))
        .getSingleOrNull();
    if (mood == null) return null;
    return MoodEntity.fromEntry(mood);
  }

  @override
  Future<List<MoodEntity>> getMoods() async {
    return (await select(moodTable).get())
        .map((entry) => MoodEntity.fromEntry(entry))
        .toList(growable: false);
  }

  @override
  Future<void> insertMood(MoodEntity mood) async {
    await into(moodTable).insert(
      mood.toCompanion(),
      mode: InsertMode.insertOrReplace,
    );
  }

  @override
  Future<void> updateMood(int id, MoodEntity newMood) async {
    await (update(moodTable)..where((tbl) => tbl.id.equals(id)))
        .write(newMood.toCompanion());
  }

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'my_database');
  }
}
