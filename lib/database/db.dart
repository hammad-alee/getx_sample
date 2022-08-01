import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLite{
  static final SQLite instance = SQLite._init();
  static Database? _database;
  SQLite._init();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('ArtGallery.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  FutureOr<void> _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE Admin (AdminID INTEGER PRIMARY KEY, AdminName TEXT, Email TEXT, 
    Password TEXT, Mobile TEXT, LoginType TEXT, AutoLogin INTEGER)
    ''');
    await db.execute('''
    CREATE TABLE AppSetting (SettingID INTEGER PRIMARY KEY, SettingName TEXT, SettingValue TEXT)
    ''');
    await db.execute('''
    CREATE TABLE SubCategory 
    (SubCatID INTEGER PRIMARY KEY, CatID INTEGER, SubCatName TEXT, OnIndex INTEGER, LastEdit TEXT)
    ''');
    await db.rawInsert("""
        INSERT INTO AppSetting 
        (SettingID, SettingName, SettingValue)  
        VALUES (1, 'SubCatLastDate', '1970-01-01 00:00:00')""");
    await db.rawInsert("""
        INSERT INTO AppSetting
        (SettingID, SettingName, SettingValue) 
        VALUES (2, 'TotalDataLastDate', '1970-01-01 00:00:00')
        """);
    await db.execute('''
    CREATE TABLE Cart 
    (CID INTEGER PRIMARY KEY, ProductID INTEGER, TypeID INTEGER, ProductName Text, Price Text, MaxQuantity INTEGER, Shipping TEXT, Image TEXT, DeliveryCharges Text, PriceIDs INTEGER)
    ''');
    await db.execute('''
    CREATE TABLE Country
    (CountryID INTEGER PRIMARY KEY, CountryName TEXT, CountryCode TEXT, LastEdit TEXT)
    ''');
    await db.execute('''
    CREATE TABLE Currency
    (CurrencyID INTEGER PRIMARY KEY, CurrencyName TEXT, CurrencySymbol TEXT, CurrencyFlag TEXT, LastEdit TEXT)
    ''');
    await db.rawInsert("""
        INSERT INTO AppSetting
        (SettingID, SettingName, SettingValue)
        VALUES (3, 'CountryLastDate', '1970-01-01 00:00:00')""");
    await db.rawInsert("""
        INSERT INTO AppSetting
        (SettingID, SettingName, SettingValue) 
        VALUES (4, 'CountryName', '')
        """);
    await db.rawInsert("""
        INSERT INTO AppSetting
        (SettingID, SettingName, SettingValue) 
        VALUES (5, 'CurrencyLastDate', '1970-01-01 00:00:00')
        """);
    await db.rawInsert("""
        INSERT INTO AppSetting
        (SettingID, SettingName, SettingValue) 
        VALUES (6, 'CurrencyName', 'GBP (£)')
        """);
    await db.rawInsert("""
        INSERT INTO AppSetting
        (SettingID, SettingName, SettingValue) 
        VALUES (7, 'CurrencyID', '2')
        """);
  }

  static updateLastEdit(value, settingName) async {
    try {
      final db = await instance.database;
      await db.rawQuery(
          "UPDATE AppSetting SET SettingValue = '$value' WHERE SettingName = '$settingName'");
    } catch (e) {
    }
  }

  static Future<String> getLastDate(String settingName) async {
    var lastEdited = "";
    final db = await instance.database;
    var queryData = await db.rawQuery(
        "SELECT * FROM AppSetting WHERE SettingName = '$settingName' ");
    var dataRow = queryData.first;
    lastEdited = dataRow['SettingValue'].toString();
    return lastEdited;
  }



}