library tema.bean;

import 'package:campusAPI/db/db.dart';

part 'temaBean.g.dart';

/// The bean
@GenBean()
// ignore: inconsistent_method_inheritance
class TemaBean extends _TemaBean implements Bean<Tema> {
  TemaBean(Adapter adapter) : super(adapter);

  /// Table name for the model this bean manager

  @Find()
  Future<Stream<Tema>> findAll() => super.findAll();

  @Find()
  Future<Stream<Tema>> findById(@WhereEq() int id) => super.findById(id);
}
