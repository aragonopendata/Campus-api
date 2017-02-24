@TestOn("vm")
import 'package:test/test.dart';

import 'route_test.dart' as route;
import 'model_test.dart' as model;
import 'bean_test.dart' as bean;

void main() {
  model.main();
  bean.main();
  route.main();
}
