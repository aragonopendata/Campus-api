library contindio_tiene_tema.model;

import 'package:campusAPI/db/db.dart';

part 'contenido_tiene_tema.g.dart';

class ContenidoTieneTema extends Object
    with JsonSerializable<ContenidoTieneTema>
    implements Jsonable {
  ContenidoTieneTema();

  ContenidoTieneTema.make(this.id, this.contenido, this.tema);

  // ignore: invalid_getter_override_return_type
  JsonSerializer<ContenidoTieneTema> get jsonSerializer =>
      new ContenidoTieneTemaJsonSerializer();

  @PrimaryKey()
  int id;

  int contenido;

  int tema;

  static String tableName = 'contenido_tiene_tema';

  String toString() => '$id $contenido $tema';
}

@GenSerializer()
@IgnoreField(#jsonSerializer)
class ContenidoTieneTemaJsonSerializer extends Object
    with JsonMixin, _$ContenidoTieneTemaJsonSerializer
    implements MapSerializer<ContenidoTieneTema> {
  ContenidoTieneTema createModel() => new ContenidoTieneTema();

  ContenidoTieneTemaJsonSerializer();
}
