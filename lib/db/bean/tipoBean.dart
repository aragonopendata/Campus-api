library tipo.bean;

import 'package:campusAPI/db/db.dart';

part 'tipoBean.g.dart';

/// The bean
@GenBean()
// ignore: inconsistent_method_inheritance
class TipoBean extends _TipoBean implements Bean<Tipo> {
  TipoBean(Adapter adapter) : super(adapter);

  /// Table name for the model this bean manager

  @Find()
  Future<Stream<Tipo>> findAll() => super.findAll();

  @Find()
  Future<Stream<Tipo>> findById(@WhereEq() int id) => super.findById(id);
}
