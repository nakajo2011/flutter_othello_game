// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// SqfEntityGenerator
// **************************************************************************

//  These classes was generated by SqfEntity
//  Copyright (c) 2019, All rights reserved. Use of this source code is governed by a
//  Apache license that can be found in the LICENSE file.

//  To use these SqfEntity classes do following:
//  - import model.dart into where to use
//  - start typing ex:Quiz.select()... (add a few filters with fluent methods)...(add orderBy/orderBydesc if you want)...
//  - and then just put end of filters / or end of only select()  toSingle() / or toList()
//  - you can select one or return List<yourObject> by your filters and orders
//  - also you can batch update or batch delete by using delete/update methods instead of tosingle/tolist methods
//    Enjoy.. Huseyin Tokpunar

// ignore_for_file:
// BEGIN TABLES
// Quiz TABLE
class TableQuiz extends SqfEntityTableBase {
  TableQuiz() {
    // declare properties of EntityTable
    tableName = 'quiz';
    primaryKeyName = 'id';
    primaryKeyType = PrimaryKeyType.integer_auto_incremental;
    useSoftDeleting = true;
    // when useSoftDeleting is true, creates a field named 'isDeleted' on the table, and set to '1' this field when item deleted (does not hard delete)

    // declare fields
    fields = [
      SqfEntityFieldBase('title', DbType.text, isNotNull: false),
      SqfEntityFieldBase('level', DbType.integer, isNotNull: false),
      SqfEntityFieldBase('black_stones', DbType.text, isNotNull: false),
      SqfEntityFieldBase('white_stones', DbType.text, isNotNull: false),
    ];
    super.init();
  }
  static SqfEntityTableBase _instance;
  static SqfEntityTableBase get getInstance {
    return _instance = _instance ?? TableQuiz();
  }
}
// END TABLES

// BEGIN DATABASE MODEL
class DrawingOthelloDbModel extends SqfEntityModelProvider {
  DrawingOthelloDbModel() {
    databaseName = drawingOthelloDbModel.databaseName;
    password = drawingOthelloDbModel.password;
    dbVersion = drawingOthelloDbModel.dbVersion;
    databaseTables = [
      TableQuiz.getInstance,
    ];

    bundledDatabasePath = drawingOthelloDbModel
        .bundledDatabasePath; //'assets/sample.db'; // This value is optional. When bundledDatabasePath is empty then EntityBase creats a new database when initializing the database
  }
  Map<String, dynamic> getControllers() {
    final controllers = <String, dynamic>{};

    return controllers;
  }
}
// END DATABASE MODEL

// BEGIN ENTITIES
// region Quiz
class Quiz {
  Quiz(
      {this.id,
      this.title,
      this.level,
      this.black_stones,
      this.white_stones,
      this.isDeleted}) {
    _setDefaultValues();
  }
  Quiz.withFields(this.title, this.level, this.black_stones, this.white_stones,
      this.isDeleted) {
    _setDefaultValues();
  }
  Quiz.withId(this.id, this.title, this.level, this.black_stones,
      this.white_stones, this.isDeleted) {
    _setDefaultValues();
  }
  Quiz.fromMap(Map<String, dynamic> o, {bool setDefaultValues = true}) {
    if (setDefaultValues) {
      _setDefaultValues();
    }
    id = int.tryParse(o['id'].toString());
    if (o['title'] != null) {
      title = o['title'] as String;
    }
    if (o['level'] != null) {
      level = int.tryParse(o['level'].toString());
    }
    if (o['black_stones'] != null) {
      black_stones = o['black_stones'] as String;
    }
    if (o['white_stones'] != null) {
      white_stones = o['white_stones'] as String;
    }
    isDeleted = o['isDeleted'] != null
        ? o['isDeleted'] == 1 || o['isDeleted'] == true
        : null;
  }
  // FIELDS (Quiz)
  int id;
  String title;
  int level;
  String black_stones;
  String white_stones;
  bool isDeleted;

  BoolResult saveResult;
  // end FIELDS (Quiz)

  static const bool _softDeleteActivated = true;
  QuizManager __mnQuiz;

  QuizManager get _mnQuiz {
    return __mnQuiz = __mnQuiz ?? QuizManager();
  }

  // METHODS
  Map<String, dynamic> toMap(
      {bool forQuery = false, bool forJson = false, bool forView = false}) {
    final map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    if (title != null) {
      map['title'] = title;
    }

    if (level != null) {
      map['level'] = level;
    }

    if (black_stones != null) {
      map['black_stones'] = black_stones;
    }

    if (white_stones != null) {
      map['white_stones'] = white_stones;
    }

    if (isDeleted != null) {
      map['isDeleted'] = forQuery ? (isDeleted ? 1 : 0) : isDeleted;
    }

    return map;
  }

  Future<Map<String, dynamic>> toMapWithChildren(
      [bool forQuery = false,
      bool forJson = false,
      bool forView = false]) async {
    final map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    if (title != null) {
      map['title'] = title;
    }

    if (level != null) {
      map['level'] = level;
    }

    if (black_stones != null) {
      map['black_stones'] = black_stones;
    }

    if (white_stones != null) {
      map['white_stones'] = white_stones;
    }

    if (isDeleted != null) {
      map['isDeleted'] = forQuery ? (isDeleted ? 1 : 0) : isDeleted;
    }

    return map;
  }

  /// This method returns Json String [Quiz]
  String toJson() {
    return json.encode(toMap(forJson: true));
  }

  /// This method returns Json String [Quiz]
  Future<String> toJsonWithChilds() async {
    return json.encode(await toMapWithChildren(false, true));
  }

  List<dynamic> toArgs() {
    return [title, level, black_stones, white_stones, isDeleted];
  }

  List<dynamic> toArgsWithIds() {
    return [id, title, level, black_stones, white_stones, isDeleted];
  }

  static Future<List<Quiz>> fromWebUrl(String url,
      {Map<String, String> headers}) async {
    try {
      final response = await http.get(url, headers: headers);
      return await fromJson(response.body);
    } catch (e) {
      print('SQFENTITY ERROR Quiz.fromWebUrl: ErrorMessage: ${e.toString()}');
      return null;
    }
  }

  Future<http.Response> postUrl(String url, {Map<String, String> headers}) {
    return http.post(url, headers: headers, body: toJson());
  }

  static Future<List<Quiz>> fromJson(String jsonBody) async {
    final Iterable list = await json.decode(jsonBody) as Iterable;
    var objList = <Quiz>[];
    try {
      objList = list
          .map((quiz) => Quiz.fromMap(quiz as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('SQFENTITY ERROR Quiz.fromJson: ErrorMessage: ${e.toString()}');
    }
    return objList;
  }

  static Future<List<Quiz>> fromMapList(List<dynamic> data,
      {bool preload = false,
      List<String> preloadFields,
      bool loadParents = false,
      List<String> loadedFields,
      bool setDefaultValues = true}) async {
    final List<Quiz> objList = <Quiz>[];
    loadedFields = loadedFields ?? [];
    for (final map in data) {
      final obj = Quiz.fromMap(map as Map<String, dynamic>,
          setDefaultValues: setDefaultValues);

      objList.add(obj);
    }
    return objList;
  }

  /// returns Quiz by ID if exist, otherwise returns null
  ///
  /// Primary Keys: int id
  ///
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  ///
  /// ex: getById(preload:true) -> Loads all related objects
  ///
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  ///
  /// ex: getById(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  ///
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  ///
  /// <returns>returns Quiz if exist, otherwise returns null
  Future<Quiz> getById(int id,
      {bool preload = false,
      List<String> preloadFields,
      bool loadParents = false,
      List<String> loadedFields}) async {
    if (id == null) {
      return null;
    }
    Quiz obj;
    final data = await _mnQuiz.getById([id]);
    if (data.length != 0) {
      obj = Quiz.fromMap(data[0] as Map<String, dynamic>);
    } else {
      obj = null;
    }
    return obj;
  }

  /// Saves the (Quiz) object. If the id field is null, saves as a new record and returns new id, if id is not null then updates record

  /// <returns>Returns id
  Future<int> save() async {
    if (id == null || id == 0) {
      id = await _mnQuiz.insert(this);
    } else {
      // id= await _upsert(); // removed in sqfentity_gen 1.3.0+6
      await _mnQuiz.update(this);
    }

    return id;
  }

  /// saveAs Quiz. Returns a new Primary Key value of Quiz

  /// <returns>Returns a new Primary Key value of Quiz
  Future<int> saveAs() async {
    id = null;

    return save();
  }

  /// saveAll method saves the sent List<Quiz> as a bulk in one transaction
  ///
  /// Returns a <List<BoolResult>>
  static Future<List<dynamic>> saveAll(List<Quiz> quizs) async {
    // final results = _mnQuiz.saveAll('INSERT OR REPLACE INTO quiz (id,title, level, black_stones, white_stones,isDeleted)  VALUES (?,?,?,?,?,?)',quizs);
    // return results; removed in sqfentity_gen 1.3.0+6
    await DrawingOthelloDbModel().batchStart();
    for (final obj in quizs) {
      await obj.save();
    }
    //    return DrawingOthelloDbModel().batchCommit();
    final result = await DrawingOthelloDbModel().batchCommit();
    for (int i = 0; i < quizs.length; i++) {
      if (quizs[i].id == null) {
        quizs[i].id = result[i] as int;
      }
    }

    return result;
  }

  /// Updates if the record exists, otherwise adds a new row

  /// <returns>Returns id
  Future<int> upsert() async {
    try {
      if (await _mnQuiz.rawInsert(
              'INSERT OR REPLACE INTO quiz (id,title, level, black_stones, white_stones,isDeleted)  VALUES (?,?,?,?,?,?)',
              [id, title, level, black_stones, white_stones, isDeleted]) ==
          1) {
        saveResult = BoolResult(
            success: true, successMessage: 'Quiz id=$id updated successfully');
      } else {
        saveResult = BoolResult(
            success: false, errorMessage: 'Quiz id=$id did not update');
      }
      return id;
    } catch (e) {
      saveResult = BoolResult(
          success: false,
          errorMessage: 'Quiz Save failed. Error: ${e.toString()}');
      return 0;
    }
  }

  /// inserts or replaces the sent List<<Quiz>> as a bulk in one transaction.
  ///
  /// upsertAll() method is faster then saveAll() method. upsertAll() should be used when you are sure that the primary key is greater than zero
  ///
  /// Returns a BoolCommitResult
  Future<BoolCommitResult> upsertAll(List<Quiz> quizs) async {
    final results = await _mnQuiz.rawInsertAll(
        'INSERT OR REPLACE INTO quiz (id,title, level, black_stones, white_stones,isDeleted)  VALUES (?,?,?,?,?,?)',
        quizs);
    return results;
  }

  /// Deletes Quiz

  /// <returns>BoolResult res.success=Deleted, not res.success=Can not deleted
  Future<BoolResult> delete([bool hardDelete = false]) async {
    print('SQFENTITIY: delete Quiz invoked (id=$id)');
    if (!_softDeleteActivated || hardDelete || isDeleted) {
      return _mnQuiz
          .delete(QueryParams(whereString: 'id=?', whereArguments: [id]));
    } else {
      return _mnQuiz.updateBatch(
          QueryParams(whereString: 'id=?', whereArguments: [id]),
          {'isDeleted': 1});
    }
  }

  /// Recover Quiz>

  /// <returns>BoolResult res.success=Recovered, not res.success=Can not recovered
  Future<BoolResult> recover([bool recoverChilds = true]) async {
    print('SQFENTITIY: recover Quiz invoked (id=$id)');
    {
      return _mnQuiz.updateBatch(
          QueryParams(whereString: 'id=?', whereArguments: [id]),
          {'isDeleted': 0});
    }
  }

  QuizFilterBuilder select({List<String> columnsToSelect, bool getIsDeleted}) {
    return QuizFilterBuilder(this)
      .._getIsDeleted = getIsDeleted == true
      ..qparams.selectColumns = columnsToSelect;
  }

  QuizFilterBuilder distinct(
      {List<String> columnsToSelect, bool getIsDeleted}) {
    return QuizFilterBuilder(this)
      .._getIsDeleted = getIsDeleted == true
      ..qparams.selectColumns = columnsToSelect
      ..qparams.distinct = true;
  }

  void _setDefaultValues() {
    isDeleted = isDeleted ?? false;
  }
  // END METHODS
  // CUSTOM CODES
  /*
      you must define customCode property of your SqfEntityTable constant for ex:
      const tablePerson = SqfEntityTable(
      tableName: 'person',
      primaryKeyName: 'id',
      primaryKeyType: PrimaryKeyType.integer_auto_incremental,
      fields: [
        SqfEntityField('firstName', DbType.text),
        SqfEntityField('lastName', DbType.text),
      ],
      customCode: '''
       String fullName()
       { 
         return '$firstName $lastName';
       }
      ''');
     */
  // END CUSTOM CODES
}
// endregion quiz

// region QuizField
class QuizField extends SearchCriteria {
  QuizField(this.quizFB) {
    param = DbParameter();
  }
  DbParameter param;
  String _waitingNot = '';
  QuizFilterBuilder quizFB;

  QuizField get not {
    _waitingNot = ' NOT ';
    return this;
  }

  QuizFilterBuilder equals(dynamic pValue) {
    param.expression = '=';
    quizFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, quizFB.parameters, param, SqlSyntax.EQuals,
            quizFB._addedBlocks)
        : setCriteria(pValue, quizFB.parameters, param, SqlSyntax.NotEQuals,
            quizFB._addedBlocks);
    _waitingNot = '';
    quizFB._addedBlocks.needEndBlock[quizFB._blockIndex] =
        quizFB._addedBlocks.retVal;
    return quizFB;
  }

  QuizFilterBuilder equalsOrNull(dynamic pValue) {
    param.expression = '=';
    quizFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, quizFB.parameters, param, SqlSyntax.EQualsOrNull,
            quizFB._addedBlocks)
        : setCriteria(pValue, quizFB.parameters, param,
            SqlSyntax.NotEQualsOrNull, quizFB._addedBlocks);
    _waitingNot = '';
    quizFB._addedBlocks.needEndBlock[quizFB._blockIndex] =
        quizFB._addedBlocks.retVal;
    return quizFB;
  }

  QuizFilterBuilder isNull() {
    quizFB._addedBlocks = setCriteria(
        0,
        quizFB.parameters,
        param,
        SqlSyntax.IsNULL.replaceAll(SqlSyntax.notKeyword, _waitingNot),
        quizFB._addedBlocks);
    _waitingNot = '';
    quizFB._addedBlocks.needEndBlock[quizFB._blockIndex] =
        quizFB._addedBlocks.retVal;
    return quizFB;
  }

  QuizFilterBuilder contains(dynamic pValue) {
    if (pValue != null) {
      quizFB._addedBlocks = setCriteria(
          '%${pValue.toString()}%',
          quizFB.parameters,
          param,
          SqlSyntax.Contains.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          quizFB._addedBlocks);
      _waitingNot = '';
      quizFB._addedBlocks.needEndBlock[quizFB._blockIndex] =
          quizFB._addedBlocks.retVal;
    }
    return quizFB;
  }

  QuizFilterBuilder startsWith(dynamic pValue) {
    if (pValue != null) {
      quizFB._addedBlocks = setCriteria(
          '${pValue.toString()}%',
          quizFB.parameters,
          param,
          SqlSyntax.Contains.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          quizFB._addedBlocks);
      _waitingNot = '';
      quizFB._addedBlocks.needEndBlock[quizFB._blockIndex] =
          quizFB._addedBlocks.retVal;
      quizFB._addedBlocks.needEndBlock[quizFB._blockIndex] =
          quizFB._addedBlocks.retVal;
    }
    return quizFB;
  }

  QuizFilterBuilder endsWith(dynamic pValue) {
    if (pValue != null) {
      quizFB._addedBlocks = setCriteria(
          '%${pValue.toString()}',
          quizFB.parameters,
          param,
          SqlSyntax.Contains.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          quizFB._addedBlocks);
      _waitingNot = '';
      quizFB._addedBlocks.needEndBlock[quizFB._blockIndex] =
          quizFB._addedBlocks.retVal;
    }
    return quizFB;
  }

  QuizFilterBuilder between(dynamic pFirst, dynamic pLast) {
    if (pFirst != null && pLast != null) {
      quizFB._addedBlocks = setCriteria(
          pFirst,
          quizFB.parameters,
          param,
          SqlSyntax.Between.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          quizFB._addedBlocks,
          pLast);
    } else if (pFirst != null) {
      if (_waitingNot != '') {
        quizFB._addedBlocks = setCriteria(pFirst, quizFB.parameters, param,
            SqlSyntax.LessThan, quizFB._addedBlocks);
      } else {
        quizFB._addedBlocks = setCriteria(pFirst, quizFB.parameters, param,
            SqlSyntax.GreaterThanOrEquals, quizFB._addedBlocks);
      }
    } else if (pLast != null) {
      if (_waitingNot != '') {
        quizFB._addedBlocks = setCriteria(pLast, quizFB.parameters, param,
            SqlSyntax.GreaterThan, quizFB._addedBlocks);
      } else {
        quizFB._addedBlocks = setCriteria(pLast, quizFB.parameters, param,
            SqlSyntax.LessThanOrEquals, quizFB._addedBlocks);
      }
    }
    _waitingNot = '';
    quizFB._addedBlocks.needEndBlock[quizFB._blockIndex] =
        quizFB._addedBlocks.retVal;
    return quizFB;
  }

  QuizFilterBuilder greaterThan(dynamic pValue) {
    param.expression = '>';
    quizFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, quizFB.parameters, param, SqlSyntax.GreaterThan,
            quizFB._addedBlocks)
        : setCriteria(pValue, quizFB.parameters, param,
            SqlSyntax.LessThanOrEquals, quizFB._addedBlocks);
    _waitingNot = '';
    quizFB._addedBlocks.needEndBlock[quizFB._blockIndex] =
        quizFB._addedBlocks.retVal;
    return quizFB;
  }

  QuizFilterBuilder lessThan(dynamic pValue) {
    param.expression = '<';
    quizFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, quizFB.parameters, param, SqlSyntax.LessThan,
            quizFB._addedBlocks)
        : setCriteria(pValue, quizFB.parameters, param,
            SqlSyntax.GreaterThanOrEquals, quizFB._addedBlocks);
    _waitingNot = '';
    quizFB._addedBlocks.needEndBlock[quizFB._blockIndex] =
        quizFB._addedBlocks.retVal;
    return quizFB;
  }

  QuizFilterBuilder greaterThanOrEquals(dynamic pValue) {
    param.expression = '>=';
    quizFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, quizFB.parameters, param,
            SqlSyntax.GreaterThanOrEquals, quizFB._addedBlocks)
        : setCriteria(pValue, quizFB.parameters, param, SqlSyntax.LessThan,
            quizFB._addedBlocks);
    _waitingNot = '';
    quizFB._addedBlocks.needEndBlock[quizFB._blockIndex] =
        quizFB._addedBlocks.retVal;
    return quizFB;
  }

  QuizFilterBuilder lessThanOrEquals(dynamic pValue) {
    param.expression = '<=';
    quizFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, quizFB.parameters, param,
            SqlSyntax.LessThanOrEquals, quizFB._addedBlocks)
        : setCriteria(pValue, quizFB.parameters, param, SqlSyntax.GreaterThan,
            quizFB._addedBlocks);
    _waitingNot = '';
    quizFB._addedBlocks.needEndBlock[quizFB._blockIndex] =
        quizFB._addedBlocks.retVal;
    return quizFB;
  }

  QuizFilterBuilder inValues(dynamic pValue) {
    quizFB._addedBlocks = setCriteria(
        pValue,
        quizFB.parameters,
        param,
        SqlSyntax.IN.replaceAll(SqlSyntax.notKeyword, _waitingNot),
        quizFB._addedBlocks);
    _waitingNot = '';
    quizFB._addedBlocks.needEndBlock[quizFB._blockIndex] =
        quizFB._addedBlocks.retVal;
    return quizFB;
  }
}
// endregion QuizField

// region QuizFilterBuilder
class QuizFilterBuilder extends SearchCriteria {
  QuizFilterBuilder(Quiz obj) {
    whereString = '';
    qparams = QueryParams();
    parameters = <DbParameter>[];
    orderByList = <String>[];
    groupByList = <String>[];
    _addedBlocks = AddedBlocks(<bool>[], <bool>[]);
    _addedBlocks.needEndBlock.add(false);
    _addedBlocks.waitingStartBlock.add(false);
    _pagesize = 0;
    _page = 0;
    _obj = obj;
  }
  AddedBlocks _addedBlocks;
  int _blockIndex = 0;
  List<DbParameter> parameters;
  List<String> orderByList;
  Quiz _obj;
  QueryParams qparams;
  int _pagesize;
  int _page;

  /// put the sql keyword 'AND'
  QuizFilterBuilder get and {
    if (parameters.isNotEmpty) {
      parameters[parameters.length - 1].wOperator = ' AND ';
    }
    return this;
  }

  /// put the sql keyword 'OR'
  QuizFilterBuilder get or {
    if (parameters.isNotEmpty) {
      parameters[parameters.length - 1].wOperator = ' OR ';
    }
    return this;
  }

  /// open parentheses
  QuizFilterBuilder get startBlock {
    _addedBlocks.waitingStartBlock.add(true);
    _addedBlocks.needEndBlock.add(false);
    _blockIndex++;
    if (_blockIndex > 1) {
      _addedBlocks.needEndBlock[_blockIndex - 1] = true;
    }
    return this;
  }

  /// String whereCriteria, write raw query without 'where' keyword. Like this: 'field1 like 'test%' and field2 = 3'
  QuizFilterBuilder where(String whereCriteria, {dynamic parameterValue}) {
    if (whereCriteria != null && whereCriteria != '') {
      final DbParameter param = DbParameter(
          columnName: parameterValue == null ? null : '',
          hasParameter: parameterValue != null);
      _addedBlocks = setCriteria(parameterValue ?? 0, parameters, param,
          '($whereCriteria)', _addedBlocks);
      _addedBlocks.needEndBlock[_blockIndex] = _addedBlocks.retVal;
    }
    return this;
  }

  /// page = page number,
  ///
  /// pagesize = row(s) per page
  QuizFilterBuilder page(int page, int pagesize) {
    if (page > 0) {
      _page = page;
    }
    if (pagesize > 0) {
      _pagesize = pagesize;
    }
    return this;
  }

  /// int count = LIMIT
  QuizFilterBuilder top(int count) {
    if (count > 0) {
      _pagesize = count;
    }
    return this;
  }

  /// close parentheses
  QuizFilterBuilder get endBlock {
    if (_addedBlocks.needEndBlock[_blockIndex]) {
      parameters[parameters.length - 1].whereString += ' ) ';
    }
    _addedBlocks.needEndBlock.removeAt(_blockIndex);
    _addedBlocks.waitingStartBlock.removeAt(_blockIndex);
    _blockIndex--;
    return this;
  }

  /// argFields might be String or List<String>.
  ///
  /// Example 1: argFields='name, date'
  ///
  /// Example 2: argFields = ['name', 'date']
  QuizFilterBuilder orderBy(dynamic argFields) {
    if (argFields != null) {
      if (argFields is String) {
        orderByList.add(argFields);
      } else {
        for (String s in argFields as List<String>) {
          if (s != null && s.isNotEmpty) {
            orderByList.add(' $s ');
          }
        }
      }
    }
    return this;
  }

  /// argFields might be String or List<String>.
  ///
  /// Example 1: argFields='field1, field2'
  ///
  /// Example 2: argFields = ['field1', 'field2']
  QuizFilterBuilder orderByDesc(dynamic argFields) {
    if (argFields != null) {
      if (argFields is String) {
        orderByList.add('$argFields desc ');
      } else {
        for (String s in argFields as List<String>) {
          if (s != null && s.isNotEmpty) {
            orderByList.add(' $s desc ');
          }
        }
      }
    }
    return this;
  }

  /// argFields might be String or List<String>.
  ///
  /// Example 1: argFields='field1, field2'
  ///
  /// Example 2: argFields = ['field1', 'field2']
  QuizFilterBuilder groupBy(dynamic argFields) {
    if (argFields != null) {
      if (argFields is String) {
        groupByList.add(' $argFields ');
      } else {
        for (String s in argFields as List<String>) {
          if (s != null && s.isNotEmpty) {
            groupByList.add(' $s ');
          }
        }
      }
    }
    return this;
  }

  /// argFields might be String or List<String>.
  ///
  /// Example 1: argFields='name, date'
  ///
  /// Example 2: argFields = ['name', 'date']
  QuizFilterBuilder having(dynamic argFields) {
    if (argFields != null) {
      if (argFields is String) {
        havingList.add(argFields);
      } else {
        for (String s in argFields as List<String>) {
          if (s != null && s.isNotEmpty) {
            havingList.add(' $s ');
          }
        }
      }
    }
    return this;
  }

  QuizField setField(QuizField field, String colName, DbType dbtype) {
    return QuizField(this)
      ..param = DbParameter(
          dbType: dbtype,
          columnName: colName,
          wStartBlock: _addedBlocks.waitingStartBlock[_blockIndex]);
  }

  QuizField _id;
  QuizField get id {
    return _id = setField(_id, 'id', DbType.integer);
  }

  QuizField _title;
  QuizField get title {
    return _title = setField(_title, 'title', DbType.text);
  }

  QuizField _level;
  QuizField get level {
    return _level = setField(_level, 'level', DbType.integer);
  }

  QuizField _black_stones;
  QuizField get black_stones {
    return _black_stones = setField(_black_stones, 'black_stones', DbType.text);
  }

  QuizField _white_stones;
  QuizField get white_stones {
    return _white_stones = setField(_white_stones, 'white_stones', DbType.text);
  }

  QuizField _isDeleted;
  QuizField get isDeleted {
    return _isDeleted = setField(_isDeleted, 'isDeleted', DbType.bool);
  }

  bool _getIsDeleted;

  void _buildParameters() {
    if (_page > 0 && _pagesize > 0) {
      qparams
        ..limit = _pagesize
        ..offset = (_page - 1) * _pagesize;
    } else {
      qparams
        ..limit = _pagesize
        ..offset = _page;
    }
    for (DbParameter param in parameters) {
      if (param.columnName != null) {
        if (param.value is List && !param.hasParameter) {
          param.value = param.dbType == DbType.text
              ? '\'${param.value.join('\',\'')}\''
              : param.value.join(',');
          whereString += param.whereString
              .replaceAll('{field}', param.columnName)
              .replaceAll('?', param.value.toString());
          param.value = null;
        } else {
          if (param.value is Map<String, dynamic> &&
              param.value['sql'] != null) {
            param
              ..whereString = param.whereString
                  .replaceAll('?', param.value['sql'].toString())
              ..dbType = DbType.integer
              ..value = param.value['args'];
          }
          whereString +=
              param.whereString.replaceAll('{field}', param.columnName);
        }
        if (!param.whereString.contains('?')) {
        } else {
          switch (param.dbType) {
            case DbType.bool:
              param.value =
                  param.value == null ? null : param.value == true ? 1 : 0;
              param.value2 =
                  param.value2 == null ? null : param.value2 == true ? 1 : 0;
              break;
            case DbType.date:
            case DbType.datetime:
            case DbType.datetimeUtc:
              param.value = param.value == null
                  ? null
                  : (param.value as DateTime).millisecondsSinceEpoch;
              param.value2 = param.value2 == null
                  ? null
                  : (param.value2 as DateTime).millisecondsSinceEpoch;
              break;
            default:
          }
          if (param.value != null) {
            if (param.value is List) {
              for (var p in param.value) {
                whereArguments.add(p);
              }
            } else {
              whereArguments.add(param.value);
            }
          }
          if (param.value2 != null) {
            whereArguments.add(param.value2);
          }
        }
      } else {
        whereString += param.whereString;
      }
    }
    if (Quiz._softDeleteActivated) {
      if (whereString != '') {
        whereString =
            '${!_getIsDeleted ? 'ifnull(isDeleted,0)=0 AND' : ''} ($whereString)';
      } else if (!_getIsDeleted) {
        whereString = 'ifnull(isDeleted,0)=0';
      }
    }

    if (whereString != '') {
      qparams.whereString = whereString;
    }
    qparams
      ..whereArguments = whereArguments
      ..groupBy = groupByList.join(',')
      ..orderBy = orderByList.join(',')
      ..having = havingList.join(',');
  }

  /// Deletes List<Quiz> bulk by query
  ///
  /// <returns>BoolResult res.success=Deleted, not res.success=Can not deleted
  Future<BoolResult> delete([bool hardDelete = false]) async {
    _buildParameters();
    var r = BoolResult();

    if (Quiz._softDeleteActivated && !hardDelete) {
      r = await _obj._mnQuiz.updateBatch(qparams, {'isDeleted': 1});
    } else {
      r = await _obj._mnQuiz.delete(qparams);
    }
    return r;
  }

  /// Recover List<Quiz> bulk by query
  Future<BoolResult> recover() async {
    _getIsDeleted = true;
    _buildParameters();
    print('SQFENTITIY: recover Quiz bulk invoked');
    return _obj._mnQuiz.updateBatch(qparams, {'isDeleted': 0});
  }

  /// using:
  ///
  /// update({'fieldName': Value})
  ///
  /// fieldName must be String. Value is dynamic, it can be any of the (int, bool, String.. )
  Future<BoolResult> update(Map<String, dynamic> values) {
    _buildParameters();
    if (qparams.limit > 0 || qparams.offset > 0) {
      qparams.whereString =
          'id IN (SELECT id from quiz ${qparams.whereString.isNotEmpty ? 'WHERE ${qparams.whereString}' : ''}${qparams.limit > 0 ? ' LIMIT ${qparams.limit}' : ''}${qparams.offset > 0 ? ' OFFSET ${qparams.offset}' : ''})';
    }
    return _obj._mnQuiz.updateBatch(qparams, values);
  }

  /// This method always returns Quiz Obj if exist, otherwise returns null
  ///
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  ///
  /// ex: toSingle(preload:true) -> Loads all related objects
  ///
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  ///
  /// ex: toSingle(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  ///
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  ///
  /// <returns>List<Quiz>
  Future<Quiz> toSingle(
      {bool preload = false,
      List<String> preloadFields,
      bool loadParents = false,
      List<String> loadedFields}) async {
    _pagesize = 1;
    _buildParameters();
    final objFuture = _obj._mnQuiz.toList(qparams);
    final data = await objFuture;
    Quiz obj;
    if (data.isNotEmpty) {
      obj = Quiz.fromMap(data[0] as Map<String, dynamic>);
    } else {
      obj = null;
    }
    return obj;
  }

  /// This method returns int. [Quiz]
  ///
  /// <returns>int
  Future<int> toCount([VoidCallback Function(int c) quizCount]) async {
    _buildParameters();
    qparams.selectColumns = ['COUNT(1) AS CNT'];
    final quizsFuture = await _obj._mnQuiz.toList(qparams);
    final int count = quizsFuture[0]['CNT'] as int;
    if (quizCount != null) {
      quizCount(count);
    }
    return count;
  }

  /// This method returns List<Quiz> [Quiz]
  ///
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  ///
  /// ex: toList(preload:true) -> Loads all related objects
  ///
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  ///
  /// ex: toList(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  ///
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  ///
  /// <returns>List<Quiz>
  Future<List<Quiz>> toList(
      {bool preload = false,
      List<String> preloadFields,
      bool loadParents = false,
      List<String> loadedFields}) async {
    final data = await toMapList();
    final List<Quiz> quizsData = await Quiz.fromMapList(data,
        preload: preload,
        preloadFields: preloadFields,
        loadParents: loadParents,
        loadedFields: loadedFields,
        setDefaultValues: qparams.selectColumns == null);
    return quizsData;
  }

  /// This method returns Json String [Quiz]
  Future<String> toJson() async {
    final list = <dynamic>[];
    final data = await toList();
    for (var o in data) {
      list.add(o.toMap(forJson: true));
    }
    return json.encode(list);
  }

  /// This method returns Json String. [Quiz]
  Future<String> toJsonWithChilds() async {
    final list = <dynamic>[];
    final data = await toList();
    for (var o in data) {
      list.add(await o.toMapWithChildren(false, true));
    }
    return json.encode(list);
  }

  /// This method returns List<dynamic>. [Quiz]
  ///
  /// <returns>List<dynamic>
  Future<List<dynamic>> toMapList() async {
    _buildParameters();
    return await _obj._mnQuiz.toList(qparams);
  }

  /// This method returns Primary Key List SQL and Parameters retVal = Map<String,dynamic>. [Quiz]
  ///
  /// retVal['sql'] = SQL statement string, retVal['args'] = whereArguments List<dynamic>;
  ///
  /// <returns>List<String>
  Map<String, dynamic> toListPrimaryKeySQL([bool buildParameters = true]) {
    final Map<String, dynamic> _retVal = <String, dynamic>{};
    if (buildParameters) {
      _buildParameters();
    }
    _retVal['sql'] = 'SELECT `id` FROM quiz WHERE ${qparams.whereString}';
    _retVal['args'] = qparams.whereArguments;
    return _retVal;
  }

  /// This method returns Primary Key List<int>.
  /// <returns>List<int>
  Future<List<int>> toListPrimaryKey([bool buildParameters = true]) async {
    if (buildParameters) {
      _buildParameters();
    }
    final List<int> idData = <int>[];
    qparams.selectColumns = ['id'];
    final idFuture = await _obj._mnQuiz.toList(qparams);

    final int count = idFuture.length;
    for (int i = 0; i < count; i++) {
      idData.add(idFuture[i]['id'] as int);
    }
    return idData;
  }

  /// Returns List<dynamic> for selected columns. Use this method for 'groupBy' with min,max,avg..  [Quiz]
  ///
  /// Sample usage: (see EXAMPLE 4.2 at https://github.com/hhtokpinar/sqfEntity#group-by)
  Future<List<dynamic>> toListObject() async {
    _buildParameters();

    final objectFuture = _obj._mnQuiz.toList(qparams);

    final List<dynamic> objectsData = <dynamic>[];
    final data = await objectFuture;
    final int count = data.length;
    for (int i = 0; i < count; i++) {
      objectsData.add(data[i]);
    }
    return objectsData;
  }

  /// Returns List<String> for selected first column
  ///
  /// Sample usage: await Quiz.select(columnsToSelect: ['columnName']).toListString()
  Future<List<String>> toListString(
      [VoidCallback Function(List<String> o) listString]) async {
    _buildParameters();

    final objectFuture = _obj._mnQuiz.toList(qparams);

    final List<String> objectsData = <String>[];
    final data = await objectFuture;
    final int count = data.length;
    for (int i = 0; i < count; i++) {
      objectsData.add(data[i][qparams.selectColumns[0]].toString());
    }
    if (listString != null) {
      listString(objectsData);
    }
    return objectsData;
  }
}
// endregion QuizFilterBuilder

// region QuizFields
class QuizFields {
  static TableField _fId;
  static TableField get id {
    return _fId = _fId ?? SqlSyntax.setField(_fId, 'id', DbType.integer);
  }

  static TableField _fTitle;
  static TableField get title {
    return _fTitle =
        _fTitle ?? SqlSyntax.setField(_fTitle, 'title', DbType.text);
  }

  static TableField _fLevel;
  static TableField get level {
    return _fLevel =
        _fLevel ?? SqlSyntax.setField(_fLevel, 'level', DbType.integer);
  }

  static TableField _fBlack_stones;
  static TableField get black_stones {
    return _fBlack_stones = _fBlack_stones ??
        SqlSyntax.setField(_fBlack_stones, 'black_stones', DbType.text);
  }

  static TableField _fWhite_stones;
  static TableField get white_stones {
    return _fWhite_stones = _fWhite_stones ??
        SqlSyntax.setField(_fWhite_stones, 'white_stones', DbType.text);
  }

  static TableField _fIsDeleted;
  static TableField get isDeleted {
    return _fIsDeleted = _fIsDeleted ??
        SqlSyntax.setField(_fIsDeleted, 'isDeleted', DbType.integer);
  }
}
// endregion QuizFields

//region QuizManager
class QuizManager extends SqfEntityProvider {
  QuizManager()
      : super(DrawingOthelloDbModel(),
            tableName: _tableName,
            primaryKeyList: _primaryKeyList,
            whereStr: _whereStr);
  static final String _tableName = 'quiz';
  static final List<String> _primaryKeyList = ['id'];
  static final String _whereStr = 'id=?';
}

//endregion QuizManager
class DrawingOthelloDbModelSequenceManager extends SqfEntityProvider {
  DrawingOthelloDbModelSequenceManager() : super(DrawingOthelloDbModel());
}
// END OF ENTITIES
