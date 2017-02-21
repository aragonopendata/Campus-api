library evento.bean;

import 'package:campusAPI/db/db.dart';

part 'eventoBean.g.dart';

/// The bean
@GenBean()
// ignore: inconsistent_method_inheritance
class EventoBean extends _EventoBean implements Bean<Evento> {
  EventoBean(Adapter adapter) : super(adapter);

  /// Table name for the model this bean manager

  @Find()
  Future<Stream<Evento>> findAll() => super.findAll();

  @Find()
  Future<Stream<Evento>> findById(@WhereEq() int id) => super.findById(id);
}
