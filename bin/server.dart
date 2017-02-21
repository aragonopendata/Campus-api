import 'package:jaguar/jaguar.dart' as jaguar;

import 'package:campusAPI/api.dart';
import 'package:jaguar/jaguar.dart';
import 'package:logging/logging.dart';

main(List<String> args) async {
  //load setting from a .yaml file
  await jaguar.Settings.parse(args);
  //load the api with the db in settings
  final CampusApi ca = new CampusApi(
      jaguar.Settings.getString('dbuser'),
      jaguar.Settings.getString('dbpass'),
      jaguar.Settings.getString('dburl'),
      jaguar.Settings.getString('dbname'));
  int port = int.parse(jaguar.Settings.getString('svport'));
  //load the configuration for the server
  Jaguar jaguarApi =
      new Jaguar(multiThread: true, port: port);

  jaguarApi.log.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  jaguarApi.addApi(new JaguarCampusApi.from(ca));
  //starts the server
  await jaguarApi.serve();
}
