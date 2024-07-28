// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $WorkoutTable extends Workout with TableInfo<$WorkoutTable, WorkoutData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkoutTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _workoutIdMeta =
      const VerificationMeta('workoutId');
  @override
  late final GeneratedColumn<String> workoutId = GeneratedColumn<String>(
      'workout_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: Constant(UuidUtil.instance.v8()));
  static const VerificationMeta _drillIdMeta =
      const VerificationMeta('drillId');
  @override
  late final GeneratedColumn<String> drillId = GeneratedColumn<String>(
      'drill_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _spentTimeMeta =
      const VerificationMeta('spentTime');
  @override
  late final GeneratedColumn<DateTime> spentTime = GeneratedColumn<DateTime>(
      'spent_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [workoutId, drillId, date, spentTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workout';
  @override
  VerificationContext validateIntegrity(Insertable<WorkoutData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('workout_id')) {
      context.handle(_workoutIdMeta,
          workoutId.isAcceptableOrUnknown(data['workout_id']!, _workoutIdMeta));
    }
    if (data.containsKey('drill_id')) {
      context.handle(_drillIdMeta,
          drillId.isAcceptableOrUnknown(data['drill_id']!, _drillIdMeta));
    } else if (isInserting) {
      context.missing(_drillIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('spent_time')) {
      context.handle(_spentTimeMeta,
          spentTime.isAcceptableOrUnknown(data['spent_time']!, _spentTimeMeta));
    } else if (isInserting) {
      context.missing(_spentTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {workoutId};
  @override
  WorkoutData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkoutData(
      workoutId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}workout_id'])!,
      drillId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}drill_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      spentTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}spent_time'])!,
    );
  }

  @override
  $WorkoutTable createAlias(String alias) {
    return $WorkoutTable(attachedDatabase, alias);
  }
}

class WorkoutData extends DataClass implements Insertable<WorkoutData> {
  final String workoutId;
  final String drillId;
  final DateTime date;
  final DateTime spentTime;
  const WorkoutData(
      {required this.workoutId,
      required this.drillId,
      required this.date,
      required this.spentTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['workout_id'] = Variable<String>(workoutId);
    map['drill_id'] = Variable<String>(drillId);
    map['date'] = Variable<DateTime>(date);
    map['spent_time'] = Variable<DateTime>(spentTime);
    return map;
  }

  WorkoutCompanion toCompanion(bool nullToAbsent) {
    return WorkoutCompanion(
      workoutId: Value(workoutId),
      drillId: Value(drillId),
      date: Value(date),
      spentTime: Value(spentTime),
    );
  }

  factory WorkoutData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkoutData(
      workoutId: serializer.fromJson<String>(json['workoutId']),
      drillId: serializer.fromJson<String>(json['drillId']),
      date: serializer.fromJson<DateTime>(json['date']),
      spentTime: serializer.fromJson<DateTime>(json['spentTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'workoutId': serializer.toJson<String>(workoutId),
      'drillId': serializer.toJson<String>(drillId),
      'date': serializer.toJson<DateTime>(date),
      'spentTime': serializer.toJson<DateTime>(spentTime),
    };
  }

  WorkoutData copyWith(
          {String? workoutId,
          String? drillId,
          DateTime? date,
          DateTime? spentTime}) =>
      WorkoutData(
        workoutId: workoutId ?? this.workoutId,
        drillId: drillId ?? this.drillId,
        date: date ?? this.date,
        spentTime: spentTime ?? this.spentTime,
      );
  WorkoutData copyWithCompanion(WorkoutCompanion data) {
    return WorkoutData(
      workoutId: data.workoutId.present ? data.workoutId.value : this.workoutId,
      drillId: data.drillId.present ? data.drillId.value : this.drillId,
      date: data.date.present ? data.date.value : this.date,
      spentTime: data.spentTime.present ? data.spentTime.value : this.spentTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutData(')
          ..write('workoutId: $workoutId, ')
          ..write('drillId: $drillId, ')
          ..write('date: $date, ')
          ..write('spentTime: $spentTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(workoutId, drillId, date, spentTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkoutData &&
          other.workoutId == this.workoutId &&
          other.drillId == this.drillId &&
          other.date == this.date &&
          other.spentTime == this.spentTime);
}

class WorkoutCompanion extends UpdateCompanion<WorkoutData> {
  final Value<String> workoutId;
  final Value<String> drillId;
  final Value<DateTime> date;
  final Value<DateTime> spentTime;
  final Value<int> rowid;
  const WorkoutCompanion({
    this.workoutId = const Value.absent(),
    this.drillId = const Value.absent(),
    this.date = const Value.absent(),
    this.spentTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkoutCompanion.insert({
    this.workoutId = const Value.absent(),
    required String drillId,
    required DateTime date,
    required DateTime spentTime,
    this.rowid = const Value.absent(),
  })  : drillId = Value(drillId),
        date = Value(date),
        spentTime = Value(spentTime);
  static Insertable<WorkoutData> custom({
    Expression<String>? workoutId,
    Expression<String>? drillId,
    Expression<DateTime>? date,
    Expression<DateTime>? spentTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (workoutId != null) 'workout_id': workoutId,
      if (drillId != null) 'drill_id': drillId,
      if (date != null) 'date': date,
      if (spentTime != null) 'spent_time': spentTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkoutCompanion copyWith(
      {Value<String>? workoutId,
      Value<String>? drillId,
      Value<DateTime>? date,
      Value<DateTime>? spentTime,
      Value<int>? rowid}) {
    return WorkoutCompanion(
      workoutId: workoutId ?? this.workoutId,
      drillId: drillId ?? this.drillId,
      date: date ?? this.date,
      spentTime: spentTime ?? this.spentTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (workoutId.present) {
      map['workout_id'] = Variable<String>(workoutId.value);
    }
    if (drillId.present) {
      map['drill_id'] = Variable<String>(drillId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (spentTime.present) {
      map['spent_time'] = Variable<DateTime>(spentTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkoutCompanion(')
          ..write('workoutId: $workoutId, ')
          ..write('drillId: $drillId, ')
          ..write('date: $date, ')
          ..write('spentTime: $spentTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DrillTable extends Drill with TableInfo<$DrillTable, DrillData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DrillTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _drillIdMeta =
      const VerificationMeta('drillId');
  @override
  late final GeneratedColumn<String> drillId = GeneratedColumn<String>(
      'drill_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: Constant(UuidUtil.instance.v8()));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _setMeta = const VerificationMeta('set');
  @override
  late final GeneratedColumn<int> set = GeneratedColumn<int>(
      'set', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _repetitionsMeta =
      const VerificationMeta('repetitions');
  @override
  late final GeneratedColumn<int> repetitions = GeneratedColumn<int>(
      'repetitions', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [drillId, name, set, repetitions];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drill';
  @override
  VerificationContext validateIntegrity(Insertable<DrillData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('drill_id')) {
      context.handle(_drillIdMeta,
          drillId.isAcceptableOrUnknown(data['drill_id']!, _drillIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('set')) {
      context.handle(
          _setMeta, set.isAcceptableOrUnknown(data['set']!, _setMeta));
    } else if (isInserting) {
      context.missing(_setMeta);
    }
    if (data.containsKey('repetitions')) {
      context.handle(
          _repetitionsMeta,
          repetitions.isAcceptableOrUnknown(
              data['repetitions']!, _repetitionsMeta));
    } else if (isInserting) {
      context.missing(_repetitionsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {drillId};
  @override
  DrillData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DrillData(
      drillId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}drill_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      set: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}set'])!,
      repetitions: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}repetitions'])!,
    );
  }

  @override
  $DrillTable createAlias(String alias) {
    return $DrillTable(attachedDatabase, alias);
  }
}

class DrillData extends DataClass implements Insertable<DrillData> {
  final String drillId;
  final String name;
  final int set;
  final int repetitions;
  const DrillData(
      {required this.drillId,
      required this.name,
      required this.set,
      required this.repetitions});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['drill_id'] = Variable<String>(drillId);
    map['name'] = Variable<String>(name);
    map['set'] = Variable<int>(set);
    map['repetitions'] = Variable<int>(repetitions);
    return map;
  }

  DrillCompanion toCompanion(bool nullToAbsent) {
    return DrillCompanion(
      drillId: Value(drillId),
      name: Value(name),
      set: Value(set),
      repetitions: Value(repetitions),
    );
  }

  factory DrillData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DrillData(
      drillId: serializer.fromJson<String>(json['drillId']),
      name: serializer.fromJson<String>(json['name']),
      set: serializer.fromJson<int>(json['set']),
      repetitions: serializer.fromJson<int>(json['repetitions']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'drillId': serializer.toJson<String>(drillId),
      'name': serializer.toJson<String>(name),
      'set': serializer.toJson<int>(set),
      'repetitions': serializer.toJson<int>(repetitions),
    };
  }

  DrillData copyWith(
          {String? drillId, String? name, int? set, int? repetitions}) =>
      DrillData(
        drillId: drillId ?? this.drillId,
        name: name ?? this.name,
        set: set ?? this.set,
        repetitions: repetitions ?? this.repetitions,
      );
  DrillData copyWithCompanion(DrillCompanion data) {
    return DrillData(
      drillId: data.drillId.present ? data.drillId.value : this.drillId,
      name: data.name.present ? data.name.value : this.name,
      set: data.set.present ? data.set.value : this.set,
      repetitions:
          data.repetitions.present ? data.repetitions.value : this.repetitions,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DrillData(')
          ..write('drillId: $drillId, ')
          ..write('name: $name, ')
          ..write('set: $set, ')
          ..write('repetitions: $repetitions')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(drillId, name, set, repetitions);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DrillData &&
          other.drillId == this.drillId &&
          other.name == this.name &&
          other.set == this.set &&
          other.repetitions == this.repetitions);
}

class DrillCompanion extends UpdateCompanion<DrillData> {
  final Value<String> drillId;
  final Value<String> name;
  final Value<int> set;
  final Value<int> repetitions;
  final Value<int> rowid;
  const DrillCompanion({
    this.drillId = const Value.absent(),
    this.name = const Value.absent(),
    this.set = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DrillCompanion.insert({
    this.drillId = const Value.absent(),
    required String name,
    required int set,
    required int repetitions,
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        set = Value(set),
        repetitions = Value(repetitions);
  static Insertable<DrillData> custom({
    Expression<String>? drillId,
    Expression<String>? name,
    Expression<int>? set,
    Expression<int>? repetitions,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (drillId != null) 'drill_id': drillId,
      if (name != null) 'name': name,
      if (set != null) 'set': set,
      if (repetitions != null) 'repetitions': repetitions,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DrillCompanion copyWith(
      {Value<String>? drillId,
      Value<String>? name,
      Value<int>? set,
      Value<int>? repetitions,
      Value<int>? rowid}) {
    return DrillCompanion(
      drillId: drillId ?? this.drillId,
      name: name ?? this.name,
      set: set ?? this.set,
      repetitions: repetitions ?? this.repetitions,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (drillId.present) {
      map['drill_id'] = Variable<String>(drillId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (set.present) {
      map['set'] = Variable<int>(set.value);
    }
    if (repetitions.present) {
      map['repetitions'] = Variable<int>(repetitions.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DrillCompanion(')
          ..write('drillId: $drillId, ')
          ..write('name: $name, ')
          ..write('set: $set, ')
          ..write('repetitions: $repetitions, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $WorkoutTable workout = $WorkoutTable(this);
  late final $DrillTable drill = $DrillTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [workout, drill];
}

typedef $$WorkoutTableCreateCompanionBuilder = WorkoutCompanion Function({
  Value<String> workoutId,
  required String drillId,
  required DateTime date,
  required DateTime spentTime,
  Value<int> rowid,
});
typedef $$WorkoutTableUpdateCompanionBuilder = WorkoutCompanion Function({
  Value<String> workoutId,
  Value<String> drillId,
  Value<DateTime> date,
  Value<DateTime> spentTime,
  Value<int> rowid,
});

class $$WorkoutTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkoutTable,
    WorkoutData,
    $$WorkoutTableFilterComposer,
    $$WorkoutTableOrderingComposer,
    $$WorkoutTableCreateCompanionBuilder,
    $$WorkoutTableUpdateCompanionBuilder> {
  $$WorkoutTableTableManager(_$AppDatabase db, $WorkoutTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$WorkoutTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$WorkoutTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> workoutId = const Value.absent(),
            Value<String> drillId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime> spentTime = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutCompanion(
            workoutId: workoutId,
            drillId: drillId,
            date: date,
            spentTime: spentTime,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> workoutId = const Value.absent(),
            required String drillId,
            required DateTime date,
            required DateTime spentTime,
            Value<int> rowid = const Value.absent(),
          }) =>
              WorkoutCompanion.insert(
            workoutId: workoutId,
            drillId: drillId,
            date: date,
            spentTime: spentTime,
            rowid: rowid,
          ),
        ));
}

class $$WorkoutTableFilterComposer
    extends FilterComposer<_$AppDatabase, $WorkoutTable> {
  $$WorkoutTableFilterComposer(super.$state);
  ColumnFilters<String> get workoutId => $state.composableBuilder(
      column: $state.table.workoutId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get drillId => $state.composableBuilder(
      column: $state.table.drillId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get spentTime => $state.composableBuilder(
      column: $state.table.spentTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$WorkoutTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $WorkoutTable> {
  $$WorkoutTableOrderingComposer(super.$state);
  ColumnOrderings<String> get workoutId => $state.composableBuilder(
      column: $state.table.workoutId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get drillId => $state.composableBuilder(
      column: $state.table.drillId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get spentTime => $state.composableBuilder(
      column: $state.table.spentTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$DrillTableCreateCompanionBuilder = DrillCompanion Function({
  Value<String> drillId,
  required String name,
  required int set,
  required int repetitions,
  Value<int> rowid,
});
typedef $$DrillTableUpdateCompanionBuilder = DrillCompanion Function({
  Value<String> drillId,
  Value<String> name,
  Value<int> set,
  Value<int> repetitions,
  Value<int> rowid,
});

class $$DrillTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DrillTable,
    DrillData,
    $$DrillTableFilterComposer,
    $$DrillTableOrderingComposer,
    $$DrillTableCreateCompanionBuilder,
    $$DrillTableUpdateCompanionBuilder> {
  $$DrillTableTableManager(_$AppDatabase db, $DrillTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$DrillTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$DrillTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> drillId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> set = const Value.absent(),
            Value<int> repetitions = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DrillCompanion(
            drillId: drillId,
            name: name,
            set: set,
            repetitions: repetitions,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<String> drillId = const Value.absent(),
            required String name,
            required int set,
            required int repetitions,
            Value<int> rowid = const Value.absent(),
          }) =>
              DrillCompanion.insert(
            drillId: drillId,
            name: name,
            set: set,
            repetitions: repetitions,
            rowid: rowid,
          ),
        ));
}

class $$DrillTableFilterComposer
    extends FilterComposer<_$AppDatabase, $DrillTable> {
  $$DrillTableFilterComposer(super.$state);
  ColumnFilters<String> get drillId => $state.composableBuilder(
      column: $state.table.drillId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get set => $state.composableBuilder(
      column: $state.table.set,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get repetitions => $state.composableBuilder(
      column: $state.table.repetitions,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$DrillTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $DrillTable> {
  $$DrillTableOrderingComposer(super.$state);
  ColumnOrderings<String> get drillId => $state.composableBuilder(
      column: $state.table.drillId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get set => $state.composableBuilder(
      column: $state.table.set,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get repetitions => $state.composableBuilder(
      column: $state.table.repetitions,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$WorkoutTableTableManager get workout =>
      $$WorkoutTableTableManager(_db, _db.workout);
  $$DrillTableTableManager get drill =>
      $$DrillTableTableManager(_db, _db.drill);
}
