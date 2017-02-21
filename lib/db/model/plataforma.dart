library plataforma.model;

import 'package:campusAPI/db/db.dart';

part 'plataforma.g.dart';

class Plataforma extends Object
    with JsonSerializable<Plataforma>
    implements Jsonable {
  Plataforma();

  Plataforma.make(this.id, this.nombre);

  // ignore: invalid_getter_override_return_type
  JsonSerializer<Plataforma> get jsonSerializer =>
      new PlataformaJsonSerializer();

  @PrimaryKey()
  int id;

  String nombre;

  static String tableName = 'plataforma';

  String toString() => '$id $nombre';
}

@GenSerializer()
@IgnoreField(#jsonSerializer)
class PlataformaJsonSerializer extends Object
    with JsonMixin, _$PlataformaJsonSerializer
    implements MapSerializer<Plataforma> {
  Plataforma createModel() => new Plataforma();

  PlataformaJsonSerializer();
}
