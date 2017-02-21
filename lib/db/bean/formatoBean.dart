library formato.bean;

import 'package:campusAPI/db/db.dart';

part 'formatoBean.g.dart';

/// The bean
@GenBean()
// ignore: inconsistent_method_inheritance
class FormatoBean extends _FormatoBean implements Bean<Formato> {
  FormatoBean(Adapter adapter) : super(adapter);

  /// Table name for the model this bean manager

  @Find()
  Future<Stream<Formato>> findAll() => super.findAll();

  @Find()
  Future<Stream<Formato>> findById(@WhereEq() int id) => super.findById(id);
}
