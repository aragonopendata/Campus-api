library contindio_tiene_tema.bean;

import 'package:campusAPI/db/db.dart';

part 'contenido_tiene_temaBean.g.dart';

/// The bean
@GenBean()
// ignore: inconsistent_method_inheritance
class ContenidoTieneTemaBean extends _ContenidoTieneTemaBean
    implements Bean<ContenidoTieneTema> {
  ContenidoTieneTemaBean(Adapter adapter) : super(adapter);

  @Find()
  Future<Stream<ContenidoTieneTema>> findAll() => super.findAll();

  @Find()
  Future<Stream<ContenidoTieneTema>> findById(@WhereEq() int id) =>
      super.findById(id);

  @Find()
  Future<Stream<ContenidoTieneTema>> findTemaFromContenido(
          @WhereEq() int contenido) =>
      super.findTemaFromContenido(contenido);
}
