library formato.model;

import 'package:campusAPI/db/db.dart';

part 'formato.g.dart';

class Formato extends Object
    with JsonSerializable<Formato>
    implements Jsonable {
  Formato();

  Formato.make(this.id, this.nombre);

  // ignore: invalid_getter_override_return_type
  JsonSerializer<Formato> get jsonSerializer => new FormatoJsonSerializer();

  @PrimaryKey()
  int id;

  String nombre;

  static String tableName = 'formato';

  String toString() => '$id $nombre';
}

@GenSerializer()
@IgnoreField(#jsonSerializer)
class FormatoJsonSerializer extends Object
    with JsonMixin, _$FormatoJsonSerializer
    implements MapSerializer<Formato> {
  Formato createModel() => new Formato();

  FormatoJsonSerializer();
}
