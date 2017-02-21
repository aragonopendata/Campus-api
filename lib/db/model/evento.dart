library evento.model;

import 'package:campusAPI/db/db.dart';

part 'evento.g.dart';

class Evento extends Object with JsonSerializable<Evento> implements Jsonable {
  Evento();

  Evento.make(this.id, this.nombre, this.lugar, this.descripcion, this.fecha);

  // ignore: invalid_getter_override_return_type
  JsonSerializer<Evento> get jsonSerializer => new EventoJsonSerializer();

  @PrimaryKey()
  int id;

  String nombre;

  String lugar;

  String descripcion;

  String fecha;

  static String tableName = 'evento';

  String toString() => '$id $nombre $lugar $descripcion $fecha';
}

@GenSerializer()
@IgnoreField(#jsonSerializer)
class EventoJsonSerializer extends Object
    with JsonMixin, _$EventoJsonSerializer
    implements MapSerializer<Evento> {
  Evento createModel() => new Evento();

  EventoJsonSerializer();
}
