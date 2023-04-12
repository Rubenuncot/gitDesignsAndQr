import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_sql/models/scan_model.dart';
export 'package:qr_sql/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider{
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    if(_database != null){
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  Future<Database?> initDB() async{
    // Path de donde almacenaremos la base de datos.
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    final path = join( documentDirectory.path, 'ScanDB.db');
    print(documentDirectory.path);

    // Crear la base de datos
    return await openDatabase(
      path, 
      version: 6,
      onOpen: (db){

      },
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Scan(
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            tipo TEXT,
            valor TEXT
          )
        ''');
      }
    );
  }

  Future newScanRow( ScanModel newScan ) async{
    //Verificar la base de datos
    final db = await database;

    final id = newScan.id;
    final tipo = newScan.tipo;
    final valor = newScan.valor;

    //Insertar a la base de datos
    final res = db!.rawInsert('''
      INSERT INTO Scans(id, tipo, valor) VALUES($id, '$tipo', '$valor') 
    ''');

    return res;
  }

  Future newScan(ScanModel newScan) async {
    final db = await database;
    final res = db!.insert('Scan', newScan.toJson());
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db!.query('Scan', where: 'id = ?', whereArgs: [id]);

    return ScanModel.fromJson(res.first);
  }
  Future<List<ScanModel?>> getAllScans() async {
    final db = await database;
    final res = await db!.query('Scan');

    return res.map((e) => ScanModel.fromJson(e)).toList();
  }
  Future<List<ScanModel?>> getScanByTipo( String tipo) async {
    final db = await database;
    final res = await db!.rawQuery('''
      SELECT * FROM Scan WHERE tipo = '$tipo'
    ''');

    return res.map((e) => ScanModel.fromJson(e)).toList();
  }
  Future<int> updateScan(ScanModel scan) async{
    final db = await database;
    final res = await db!.update('Scan', scan.toJson(), where: 'id = ?', whereArgs: [scan.id]);
    return res; 
  }
  Future<int> deleteScan( int id ) async {
    final db = await database;
    final res = db!.rawDelete('''
      DELETE FROM Scan WHERE id = $id
    ''');
    return res;
  }
  Future<int> deleteallScans() async {
    final db = await database;
    final res = db!.delete('Scan');
    return res;
  }


}