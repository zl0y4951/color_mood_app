// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_impl.dart';

// ignore_for_file: type=lint
class $MoodTableTable extends MoodTable with TableInfo<$MoodTableTable, Mood> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoodTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _moodConditionMeta =
      const VerificationMeta('moodCondition');
  @override
  late final GeneratedColumn<int> moodCondition = GeneratedColumn<int>(
      'mood_condition', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _datetimeMeta =
      const VerificationMeta('datetime');
  @override
  late final GeneratedColumn<int> datetime = GeneratedColumn<int>(
      'datetime', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  @override
  List<GeneratedColumn> get $columns => [id, moodCondition, datetime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mood_table';
  @override
  VerificationContext validateIntegrity(Insertable<Mood> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('mood_condition')) {
      context.handle(
          _moodConditionMeta,
          moodCondition.isAcceptableOrUnknown(
              data['mood_condition']!, _moodConditionMeta));
    } else if (isInserting) {
      context.missing(_moodConditionMeta);
    }
    if (data.containsKey('datetime')) {
      context.handle(_datetimeMeta,
          datetime.isAcceptableOrUnknown(data['datetime']!, _datetimeMeta));
    } else if (isInserting) {
      context.missing(_datetimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Mood map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Mood(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      moodCondition: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}mood_condition'])!,
      datetime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}datetime'])!,
    );
  }

  @override
  $MoodTableTable createAlias(String alias) {
    return $MoodTableTable(attachedDatabase, alias);
  }
}

class Mood extends DataClass implements Insertable<Mood> {
  final int id;
  final int moodCondition;
  final int datetime;
  const Mood(
      {required this.id, required this.moodCondition, required this.datetime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['mood_condition'] = Variable<int>(moodCondition);
    map['datetime'] = Variable<int>(datetime);
    return map;
  }

  MoodTableCompanion toCompanion(bool nullToAbsent) {
    return MoodTableCompanion(
      id: Value(id),
      moodCondition: Value(moodCondition),
      datetime: Value(datetime),
    );
  }

  factory Mood.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Mood(
      id: serializer.fromJson<int>(json['id']),
      moodCondition: serializer.fromJson<int>(json['moodCondition']),
      datetime: serializer.fromJson<int>(json['datetime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'moodCondition': serializer.toJson<int>(moodCondition),
      'datetime': serializer.toJson<int>(datetime),
    };
  }

  Mood copyWith({int? id, int? moodCondition, int? datetime}) => Mood(
        id: id ?? this.id,
        moodCondition: moodCondition ?? this.moodCondition,
        datetime: datetime ?? this.datetime,
      );
  Mood copyWithCompanion(MoodTableCompanion data) {
    return Mood(
      id: data.id.present ? data.id.value : this.id,
      moodCondition: data.moodCondition.present
          ? data.moodCondition.value
          : this.moodCondition,
      datetime: data.datetime.present ? data.datetime.value : this.datetime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Mood(')
          ..write('id: $id, ')
          ..write('moodCondition: $moodCondition, ')
          ..write('datetime: $datetime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, moodCondition, datetime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Mood &&
          other.id == this.id &&
          other.moodCondition == this.moodCondition &&
          other.datetime == this.datetime);
}

class MoodTableCompanion extends UpdateCompanion<Mood> {
  final Value<int> id;
  final Value<int> moodCondition;
  final Value<int> datetime;
  const MoodTableCompanion({
    this.id = const Value.absent(),
    this.moodCondition = const Value.absent(),
    this.datetime = const Value.absent(),
  });
  MoodTableCompanion.insert({
    this.id = const Value.absent(),
    required int moodCondition,
    required int datetime,
  })  : moodCondition = Value(moodCondition),
        datetime = Value(datetime);
  static Insertable<Mood> custom({
    Expression<int>? id,
    Expression<int>? moodCondition,
    Expression<int>? datetime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (moodCondition != null) 'mood_condition': moodCondition,
      if (datetime != null) 'datetime': datetime,
    });
  }

  MoodTableCompanion copyWith(
      {Value<int>? id, Value<int>? moodCondition, Value<int>? datetime}) {
    return MoodTableCompanion(
      id: id ?? this.id,
      moodCondition: moodCondition ?? this.moodCondition,
      datetime: datetime ?? this.datetime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (moodCondition.present) {
      map['mood_condition'] = Variable<int>(moodCondition.value);
    }
    if (datetime.present) {
      map['datetime'] = Variable<int>(datetime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoodTableCompanion(')
          ..write('id: $id, ')
          ..write('moodCondition: $moodCondition, ')
          ..write('datetime: $datetime')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $MoodTableTable moodTable = $MoodTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [moodTable];
}

typedef $$MoodTableTableCreateCompanionBuilder = MoodTableCompanion Function({
  Value<int> id,
  required int moodCondition,
  required int datetime,
});
typedef $$MoodTableTableUpdateCompanionBuilder = MoodTableCompanion Function({
  Value<int> id,
  Value<int> moodCondition,
  Value<int> datetime,
});

class $$MoodTableTableFilterComposer
    extends FilterComposer<_$Database, $MoodTableTable> {
  $$MoodTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get moodCondition => $state.composableBuilder(
      column: $state.table.moodCondition,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get datetime => $state.composableBuilder(
      column: $state.table.datetime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$MoodTableTableOrderingComposer
    extends OrderingComposer<_$Database, $MoodTableTable> {
  $$MoodTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get moodCondition => $state.composableBuilder(
      column: $state.table.moodCondition,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get datetime => $state.composableBuilder(
      column: $state.table.datetime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$MoodTableTableTableManager extends RootTableManager<
    _$Database,
    $MoodTableTable,
    Mood,
    $$MoodTableTableFilterComposer,
    $$MoodTableTableOrderingComposer,
    $$MoodTableTableCreateCompanionBuilder,
    $$MoodTableTableUpdateCompanionBuilder,
    (Mood, BaseReferences<_$Database, $MoodTableTable, Mood>),
    Mood,
    PrefetchHooks Function()> {
  $$MoodTableTableTableManager(_$Database db, $MoodTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MoodTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MoodTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> moodCondition = const Value.absent(),
            Value<int> datetime = const Value.absent(),
          }) =>
              MoodTableCompanion(
            id: id,
            moodCondition: moodCondition,
            datetime: datetime,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int moodCondition,
            required int datetime,
          }) =>
              MoodTableCompanion.insert(
            id: id,
            moodCondition: moodCondition,
            datetime: datetime,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MoodTableTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $MoodTableTable,
    Mood,
    $$MoodTableTableFilterComposer,
    $$MoodTableTableOrderingComposer,
    $$MoodTableTableCreateCompanionBuilder,
    $$MoodTableTableUpdateCompanionBuilder,
    (Mood, BaseReferences<_$Database, $MoodTableTable, Mood>),
    Mood,
    PrefetchHooks Function()>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$MoodTableTableTableManager get moodTable =>
      $$MoodTableTableTableManager(_db, _db.moodTable);
}
