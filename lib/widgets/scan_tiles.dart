import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/scan_provider.dart';
import '../utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final IconData icon;
  const ScanTiles({Key? key, this.icon = Icons.add}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<ScanProvider>(context);
    final scans = scanProvider.scans;

    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (context, i) => Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              background: Container(
                color: const Color.fromARGB(255, 239, 89, 89),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        'Eliminar',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              onDismissed: (direction) {
                Provider.of<ScanProvider>(context, listen: false)
                    .borrarScansId(scans[i].id);
              },
              child: ListTile(
                leading: Icon(icon),
                title: Text(scans[i].valor),
                subtitle: Text('id: ${scans[i].id}'),
                trailing: const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
                onTap: () => launchInBrowser(context, scans[i]),
              ),
            ));
  }
}
