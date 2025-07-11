// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'database/models/reminder_model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 7566778367479624035),
      name: 'Reminder',
      lastPropertyId: const obx_int.IdUid(9, 3229715550811627591),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 5033862348511644685),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 8917352257950384784),
            name: 'title',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 1396084875011640399),
            name: 'description',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 6996773556664845408),
            name: 'latitude',
            type: 8,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 4531960093224218390),
            name: 'longitude',
            type: 8,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 7141244721983001497),
            name: 'radius',
            type: 8,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 8387476958206530566),
            name: 'repeated',
            type: 1,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(8, 402787505245490580),
            name: 'reached',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(9, 3229715550811627591),
            name: 'address',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(1, 7566778367479624035),
      lastIndexId: const obx_int.IdUid(0, 0),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    Reminder: obx_int.EntityDefinition<Reminder>(
        model: _entities[0],
        toOneRelations: (Reminder object) => [],
        toManyRelations: (Reminder object) => {},
        getId: (Reminder object) => object.id,
        setId: (Reminder object, int id) {
          object.id = id;
        },
        objectToFB: (Reminder object, fb.Builder fbb) {
          final titleOffset = fbb.writeString(object.title);
          final descriptionOffset = fbb.writeString(object.description);
          final addressOffset =
              object.address == null ? null : fbb.writeString(object.address!);
          fbb.startTable(10);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addOffset(2, descriptionOffset);
          fbb.addFloat64(3, object.latitude);
          fbb.addFloat64(4, object.longitude);
          fbb.addFloat64(5, object.radius);
          fbb.addBool(6, object.repeated);
          fbb.addInt64(7, object.reached);
          fbb.addOffset(8, addressOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final titleParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final descriptionParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, '');
          final repeatedParam =
              const fb.BoolReader().vTableGet(buffer, rootOffset, 16, false);
          final reachedParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 18, 0);
          final latitudeParam =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 10, 0);
          final longitudeParam =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 12, 0);
          final radiusParam =
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 14, 0);
          final object = Reminder(
              title: titleParam,
              description: descriptionParam,
              repeated: repeatedParam,
              reached: reachedParam,
              latitude: latitudeParam,
              longitude: longitudeParam,
              radius: radiusParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..address = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 20);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [Reminder] entity fields to define ObjectBox queries.
class Reminder_ {
  /// See [Reminder.id].
  static final id =
      obx.QueryIntegerProperty<Reminder>(_entities[0].properties[0]);

  /// See [Reminder.title].
  static final title =
      obx.QueryStringProperty<Reminder>(_entities[0].properties[1]);

  /// See [Reminder.description].
  static final description =
      obx.QueryStringProperty<Reminder>(_entities[0].properties[2]);

  /// See [Reminder.latitude].
  static final latitude =
      obx.QueryDoubleProperty<Reminder>(_entities[0].properties[3]);

  /// See [Reminder.longitude].
  static final longitude =
      obx.QueryDoubleProperty<Reminder>(_entities[0].properties[4]);

  /// See [Reminder.radius].
  static final radius =
      obx.QueryDoubleProperty<Reminder>(_entities[0].properties[5]);

  /// See [Reminder.repeated].
  static final repeated =
      obx.QueryBooleanProperty<Reminder>(_entities[0].properties[6]);

  /// See [Reminder.reached].
  static final reached =
      obx.QueryIntegerProperty<Reminder>(_entities[0].properties[7]);

  /// See [Reminder.address].
  static final address =
      obx.QueryStringProperty<Reminder>(_entities[0].properties[8]);
}
