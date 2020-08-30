import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

part 'models.g.dart';


@SqfEntityBuilder(drawingOthelloDbModel)
const drawingOthelloDbModel = SqfEntityModel(
    modelName: 'drawingOthelloDbModel', // optional
    databaseName: 'drawing_othello.db',
    databaseTables: [quiz],
    bundledDatabasePath: null
);

// クイズのentity定義
const quiz = SqfEntityTable(
    tableName: 'quiz',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: true,
    fields: [
      SqfEntityField('title', DbType.text),
      SqfEntityField('level', DbType.integer),
      SqfEntityField('black_stones', DbType.text),
      SqfEntityField('white_stones', DbType.text),
    ]);
