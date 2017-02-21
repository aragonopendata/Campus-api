library tipo.model;

import 'package:campusAPI/db/db.dart';

part 'tipo.g.dart';

class Tipo extends Object with JsonSerializable<Tipo> implements Jsonable {
  Tipo();

  Tipo.make(this.id, this.nombre);

  // ignore: invalid_getter_override_return_type
  JsonSerializer<Tipo> get jsonSerializer => new TipoJsonSerializer();

  @PrimaryKey()
  int id;

  String nombre;

  static String tableName = 'tipo';

  String toString() => '$id $nombre';
}

@GenSerializer()
@IgnoreField(#jsonSerializer)
class TipoJsonSerializer extends Object
    with JsonMixin, _$TipoJsonSerializer
    implements MapSerializer<Tipo> {
  Tipo createModel() => new Tipo();

  TipoJsonSerializer();
}
