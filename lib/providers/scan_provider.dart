import 'package:flutter/material.dart';
import 'package:qr_sql/providers/db_provider.dart';

class ScanProvider extends ChangeNotifier{
  List<ScanModel> scans = [];
  String tipoSelecionado = "http";

  Future<ScanModel> nuevoScan(String valor) async{
    final nuevoScan = ScanModel(valor: valor);
    final id = await DBProvider.db.newScan(nuevoScan);

    nuevoScan.id = id;

    if(tipoSelecionado == nuevoScan.tipo){
      scans.add(nuevoScan);
      notifyListeners();
    }

    return nuevoScan;
  }

  cargarScans()async{
    final scansBd = await DBProvider.db.getAllScans();
    scans = [...scansBd];
    notifyListeners();
  }

  cargarScansPorTipo(String tipo) async{
    final scansBd = await DBProvider.db.getScanByTipo(tipo);
    tipoSelecionado = tipo;
    scans = [...scansBd];
    notifyListeners();
  }

  borrarScans() async{
    await DBProvider.db.deleteallScans();
    scans = [];
    notifyListeners();
  }

  borrarScansId(int? id) async {
    await DBProvider.db.deleteScan(id!);
  }
}