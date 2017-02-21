library plataforma.bean;

import 'package:campusAPI/db/db.dart';

part 'plataformaBean.g.dart';

/// The bean
@GenBean()
// ignore: inconsistent_method_inheritance
class PlataformaBean extends _PlataformaBean implements Bean<Plataforma> {
  PlataformaBean(Adapter adapter) : super(adapter);

  /// Table name for the model this bean manager

  @Find()
  Future<Stream<Plataforma>> findAll() => super.findAll();

  @Find()
  Future<Stream<Plataforma>> findById(@WhereEq() int id) => super.findById(id);
}
