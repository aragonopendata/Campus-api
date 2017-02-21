library tema.model;

import 'package:campusAPI/db/db.dart';

part 'tema.g.dart';

class Tema extends Object with JsonSerializable<Tema> implements Jsonable {
  Tema();

  Tema.make(this.id, this.nombre);

  // ignore: invalid_getter_override_return_type
  JsonSerializer<Tema> get jsonSerializer => new TemaJsonSerializer();

  @PrimaryKey()
  int id;

  String nombre;

  static String tableName = 'tema';

  String toString() => '$id $nombre';
}

@GenSerializer()
@IgnoreField(#jsonSerializer)
class TemaJsonSerializer extends Object
    with JsonMixin, _$TemaJsonSerializer
    implements MapSerializer<Tema> {
  Tema createModel() => new Tema();

  TemaJsonSerializer();
}
