library contindio.model;

import 'package:campusAPI/db/db.dart';

part 'contenido.g.dart';

class Contenido extends Object
    with JsonSerializable<Contenido>
    implements Jsonable {
  Contenido();

  Contenido.make(
      this.id,
      this.titulo,
      this.descripcion,
      this.formato,
      this.tipo,
      this.evento,
      this.aparece,
      this.url,
      this.plataforma,
      this.thumbnail);

  // ignore: invalid_getter_override_return_type
  JsonSerializer<Contenido> get jsonSerializer => new ContenidoJsonSerializer();

  @PrimaryKey()
  int id;

  String titulo;

  String descripcion;

  int formato;

  int tipo;

  int evento;

  String aparece;

  String url;

  int plataforma;

  String thumbnail;

  static String tableName = 'contenido';

  String toString() =>
      '$id $titulo $descripcion $formato $tipo $evento $aparece $url $plataforma $thumbnail';
}

@GenSerializer()
@IgnoreField(#jsonSerializer)
class ContenidoJsonSerializer extends Object
    with JsonMixin, _$ContenidoJsonSerializer
    implements MapSerializer<Contenido> {
  Contenido createModel() => new Contenido();

  ContenidoJsonSerializer();
}
