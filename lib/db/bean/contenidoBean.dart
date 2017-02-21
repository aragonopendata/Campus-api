library contindio.bean;

import 'package:campusAPI/db/db.dart';

part 'contenidoBean.g.dart';

/// The bean
@GenBean()
// ignore: inconsistent_method_inheritance
class ContenidoBean extends _ContenidoBean implements Bean<Contenido> {
  ContenidoBean(Adapter adapter) : super(adapter);

  /*@Find()
  Future<Stream<Contenido>> findById(@WhereEq() int id) => super.findById(id);*/

  Future<Map> findById(
      int id) async {
    FindStatement _finder = finderQ.where(this.id.eq(id));
    List<Map> _maps = await (await adapter.find(_finder)).toList();

    Map _contenidos;

    for (Map map in _maps) {
      await Future.wait([
        getFormatoFromId(map['formato']),
        getEventoFromId(map['evento']),
        getTipoFromId(map['tipo']),
        getPlataformaFromId(map['plataforma']),
        getTemasFromContenido(map['id'])
      ]).then((list) {
        _contenidos = {
          'id': map['id'],
          'titulo': map['titulo'],
          'descripcion': map['descripcion'],
          'formato': list[0],
          'evento': list[1],
          'tipo': list[2],
          'aparece': map['aparece'],
          'url': map['url'],
          'plataforma': list[3],
          'thumbnail': map['thumbnail'],
          'temas': list[4],
        };
      });
    }
    return _contenidos;
  }

  Future<List<Map>> findWithOptionals(
      int limit, int offset, Map parameters) async {
    FindStatement _finder = finderQ.orderBy('id').limit(limit).offset(offset);

    if (parameters['formato'] != null) {
      _finder.where(this.formato.eq(parameters['formato']));
    }
    if (parameters['plataforma'] != null) {
      _finder.where(this.plataforma.eq(parameters['plataforma']));
    }
    if (parameters['evento'] != null) {
      _finder.where(this.evento.eq(parameters['evento']));
    }
    if (parameters['aparece'] != null) {
      _finder.where(this.aparece.eq(parameters['aparece']));
    }
    if (parameters['tipo'] != null) {
      _finder.where(this.tipo.eq(parameters['tipo']));
    }
    if (parameters['tema'] != null) {
      _finder
          .select('contenido.*')
          .leftJoin(ContenidoTieneTema.tableName, 'ct')
          .joinOn(eq('contenido.id', C('ct.contenido')))
          .where(eqInt('ct.tema', parameters['tema']));
    }

    List<Map> _maps = await (await adapter.find(_finder)).toList();

    List<Map> _contenidos = new List();

    for (Map map in _maps) {
      await Future.wait([
        getFormatoFromId(map['formato']),
        getEventoFromId(map['evento']),
        getTipoFromId(map['tipo']),
        getPlataformaFromId(map['plataforma']),
        getTemasFromContenido(map['id'])
      ]).then((list) {
        _contenidos.add({
          'id': map['id'],
          'titulo': map['titulo'],
          'descripcion': map['descripcion'],
          'formato': list[0],
          'evento': list[1],
          'tipo': list[2],
          'aparece': map['aparece'],
          'url': map['url'],
          'plataforma': list[3],
          'thumbnail': map['thumbnail'],
          'temas': list[4],
        });
      });
    }
    return _contenidos;
  }

  findAllPonentes() async{
    FindStatement _finder = finderQ.select('aparece').groupBy('aparece');
    return execFind(_finder);
  }

  getEventoFromId(int id) async {
    EventoBean bean = new EventoBean(adapter);
    Stream<Evento> stream = await bean.findById(id);
    List streamList = await stream.toList();
    return streamList[0];
  }

  getTipoFromId(int id) async {
    TipoBean bean = new TipoBean(adapter);
    Stream<Tipo> stream = await bean.findById(id);
    List streamList = await stream.toList();
    return streamList[0];
  }

  getFormatoFromId(int id) async {
    FormatoBean bean = new FormatoBean(adapter);
    Stream<Formato> stream = await bean.findById(id);
    List streamList = await stream.toList();
    return streamList[0];
  }

  getPlataformaFromId(int id) async {
    PlataformaBean bean = new PlataformaBean(adapter);
    Stream<Plataforma> stream = await bean.findById(id);
    List streamList = await stream.toList();
    return streamList[0];
  }

  getTemaFromId(int id) async {
    TemaBean bean = new TemaBean(adapter);
    Stream<Tema> stream = await bean.findById(id);
    List streamList = await stream.toList();
    return streamList[0];
  }

  getTemasFromContenido(int id) async {
    ContenidoTieneTemaBean bean = new ContenidoTieneTemaBean(adapter);
    Stream<ContenidoTieneTema> stream = await bean.findTemaFromContenido(id);
    List streamList = await stream.toList();
    List<Tema> temas = new List();
    for (ContenidoTieneTema data in streamList) {
      temas.add(await getTemaFromId(data.tema));
    }
    return temas;
  }

  getCount(Map parameters) async {
  FindStatement _finder = finderQ;

  if (parameters['formato'] != null) {
  _finder.where(this.formato.eq(parameters['formato']));
  }
  if (parameters['plataforma'] != null) {
  _finder.where(this.plataforma.eq(parameters['plataforma']));
  }
  if (parameters['evento'] != null) {
  _finder.where(this.evento.eq(parameters['evento']));
  }
  if (parameters['aparece'] != null) {
  _finder.where(this.aparece.eq(parameters['aparece']));
  }
  if (parameters['tipo'] != null) {
  _finder.where(this.tipo.eq(parameters['tipo']));
  }
  if (parameters['tema'] != null) {
  _finder
      .count('contenido.*')
      .leftJoin(ContenidoTieneTema.tableName, 'ct')
      .joinOn(eq('contenido.id', C('ct.contenido')))
      .where(eqInt('ct.tema', parameters['tema']));
  }else{
    _finder.count('*');
  }
    List<Map> _maps = await (await adapter.find(_finder)).toList();
    return _maps;
  }
}
