library api;

import 'dart:async';
//import 'dart:io';

import 'package:jaguar/jaguar.dart';
import 'package:jaguar/interceptors.dart';
import 'package:campusAPI/db/db.dart';
import 'package:postgresql/postgresql.dart';

part 'api.g.dart';

///String de conexion a la base de datos
var campusConnection;

///Grupo de rutas de contenido
@RouteGroup(path: '/contenido')
class ContenidoRouteGroup{
  ContenidoBean bean;
  WrapEncodeToJson jsonEncoder() => new WrapEncodeToJson();
  WrapPostgresDb postgresDb() => new WrapPostgresDb(campusConnection);
  WrapEncodeJsonableList jsonableList() => new WrapEncodeJsonableList();

  ///Devuelve una lista de todos los contenidos
  ///
  /// @param db Conexion de base de datos autogenerada
  /// @param offset añade un offset a la busqueda
  /// @param limit limita el numero de resultados
  /// @param formato Busca contenidos con la misma id de formato
  /// @param evento  Busca contenidos con la misma id de evento
  /// @param plataforma Busca conenidos con la misma id de plataforma
  /// @param aparece Busca contenidos con la misma id de aparece
  /// @param tema Busca contenidos con la misma id de tema
  @Get(headers: const {'Content-Language': 'es-ES', 'charset': 'UTF-8'})
  //@WrapPostgresDb(campusConnection) // ignore: const_with_non_constant_argument
  //@WrapEncodeToJson()
  @Wrap(const [#jsonEncoder,#postgresDb])
  Future<List<Map>> getAll(@Input(PostgresDb) Connection db,
      {int offset: 0,
      int limit: 10,
      int formato,
      int evento,
      int plataforma,
      String aparece,
      int tema,
      int tipo}) async {
    Adapter _adapter = new PgAdapter.FromConnection(db);
    bean = await new ContenidoBean(_adapter);
    Map parameters = {
      'formato': formato,
      'evento': evento,
      'plataforma': plataforma,
      'aparece': aparece,
      'tema': tema,
      'tipo': tipo
    };
    return bean.findWithOptionals(limit, offset, parameters);
  }

  ///Devuelve un contenido por id
  @Get(path: '/:id', pathRegEx: const {'id': r'^[0-9]+$'})
  //@WrapPostgresDb(campusConnection) // ignore: const_with_non_constant_argument
  //@WrapEncodeMapToJson()
  @Wrap(const [#jsonEncoder,#postgresDb])
  Future<Map> getById(@Input(PostgresDb) Connection db, int id) async {
    Adapter _adapter = new PgAdapter.FromConnection(db);
    bean = new ContenidoBean(_adapter);
    /*Map stream = await bean.findById(id);
    return stream.toList();*/
    return await bean.findById(id);
  }

  ///Devuelve el numero de contenidos existentes
  @Get(path: '/count')
  //@WrapPostgresDb(campusConnection) // ignore: const_with_non_constant_argument
  //@WrapEncodeMapToJson()
  @Wrap(const [#jsonEncoder,#postgresDb])
  Future<List> getCount(@Input(PostgresDb) Connection db,
      {int formato,
      int evento,
      int plataforma,
      String aparece,
      int tema,
      int tipo}) async {
    Map parameters = {
      'formato': formato,
      'evento': evento,
      'plataforma': plataforma,
      'aparece': aparece,
      'tema': tema,
      'tipo': tipo
    };
    Adapter _adapter = new PgAdapter.FromConnection(db);
    bean = new ContenidoBean(_adapter);
    return await bean.getCount(parameters);
  }
}

///Grupo de rutas de evento
@RouteGroup(path: '/evento')
class EventoRouteGroup{
  EventoBean bean;
  WrapEncodeToJson jsonEncoder() => new WrapEncodeToJson();
  WrapPostgresDb postgresDb() => new WrapPostgresDb(campusConnection);
  WrapEncodeJsonableList jsonableList() => new WrapEncodeJsonableList();

  ///devuelve todos los eventos
  @Get()
  //@WrapPostgresDb(campusConnection)
  //@WrapEncodeJsonableList()
  @Wrap(const [#jsonEncoder,#postgresDb])
  Future<List> getAll(@Input(PostgresDb) Connection db) async {
    Adapter _adapter = new PgAdapter.FromConnection(db);
    bean = new EventoBean(_adapter);
    Stream<Evento> stream = await bean.findAll();
    return stream.toList();
  }

  ///devuelve un evento por id
  @Get(path: '/:id', pathRegEx: const {'id': r'^[0-9]+$'})
  //@WrapPostgresDb(campusConnection) // ignore: const_with_non_constant_argument
  //@WrapEncodeMapToJson()
  @Wrap(const [#jsonEncoder,#postgresDb])
  Future<List> getById(@Input(PostgresDb) Connection db, int id) async {
    Adapter _adapter = new PgAdapter.FromConnection(db);
    bean = new EventoBean(_adapter);
    Stream<Evento> stream = await bean.findById(id);
    return stream.toList();
  }
}

///Grupo de rutas de formato
@RouteGroup(path: '/formato')
class FormatoRouteGroup{
  FormatoBean bean;
  WrapEncodeToJson jsonEncoder() => new WrapEncodeToJson();
  WrapPostgresDb postgresDb() => new WrapPostgresDb(campusConnection);
  WrapEncodeJsonableList jsonableList() => new WrapEncodeJsonableList();

  ///devuelve todos los formatos
  @Get()
  //@WrapPostgresDb(campusConnection) // ignore: const_with_non_constant_argument
  //@WrapEncodeJsonableList()
  @Wrap(const [#jsonableList,#postgresDb])
  Future<List> getAll(@Input(PostgresDb) Connection db) async {
    Adapter _adapter = new PgAdapter.FromConnection(db);
    bean = new FormatoBean(_adapter);
    Stream<Formato> stream = await bean.findAll();
    return stream.toList();
  }

  ///devuelve un formato por id
  @Get(path: '/:id', pathRegEx: const {'id': r'^[0-9]+$'})
  //@WrapPostgresDb(campusConnection) // ignore: const_with_non_constant_argument
  //@WrapEncodeMapToJson()
  @Wrap(const [#jsonEncoder,#postgresDb])
  Future<List> getById(@Input(PostgresDb) Connection db, int id) async {
    Adapter _adapter = new PgAdapter.FromConnection(db);
    bean = new FormatoBean(_adapter);
    Stream<Formato> stream = await bean.findById(id);
    return stream.toList();
  }
}

///Grupo de rutas de plataforma
@RouteGroup(path: '/plataforma')
class PlataformaRouteGroup{
  PlataformaBean bean;
  WrapEncodeToJson jsonEncoder() => new WrapEncodeToJson();
  WrapPostgresDb postgresDb() => new WrapPostgresDb(campusConnection);
  WrapEncodeJsonableList jsonableList() => new WrapEncodeJsonableList();

  ///devuelve todas las plataformas
  @Get()
  //@WrapPostgresDb(campusConnection) // ignore: const_with_non_constant_argument
  //@WrapEncodeJsonableList()
  @Wrap(const [#jsonableList,#postgresDb])
  Future<List> getAll(@Input(PostgresDb) Connection db) async {
    Adapter _adapter = new PgAdapter.FromConnection(db);
    bean = new PlataformaBean(_adapter);
    Stream<Plataforma> stream = await bean.findAll();
    return stream.toList();
  }

  ///devuelve una plataforma por id
  @Get(path: '/:id', pathRegEx: const {'id': r'^[0-9]+$'})
  //@WrapPostgresDb(campusConnection) // ignore: const_with_non_constant_argument
  //@WrapEncodeMapToJson()
  @Wrap(const [#jsonEncoder,#postgresDb])
  Future<List> getById(@Input(PostgresDb) Connection db, int id) async {
    Adapter _adapter = new PgAdapter.FromConnection(db);
    bean = new PlataformaBean(_adapter);
    Stream<Plataforma> stream = await bean.findById(id);
    return stream.toList();
  }
}

///Grupo de rutas de tema
@RouteGroup(path: '/tema')
class TemaRouteGroup{
  TemaBean bean;
  WrapEncodeToJson jsonEncoder() => new WrapEncodeToJson();
  WrapPostgresDb postgresDb() => new WrapPostgresDb(campusConnection);
  WrapEncodeJsonableList jsonableList() => new WrapEncodeJsonableList();

  ///devuelve todos los temas
  @Get()
  //@WrapPostgresDb(campusConnection) // ignore: const_with_non_constant_argument
  //@WrapEncodeJsonableList()
  @Wrap(const [#jsonableList,#postgresDb])
  Future<List> getAll(@Input(PostgresDb) Connection db) async {
    Adapter _adapter = new PgAdapter.FromConnection(db);
    bean = new TemaBean(_adapter);
    Stream<Tema> stream = await bean.findAll();
    return stream.toList();
  }

  ///devuelve un tema por id
  @Get(path: '/:id', pathRegEx: const {'id': r'^[0-9]+$'})
  //@WrapPostgresDb(campusConnection) // ignore: const_with_non_constant_argument
  //@WrapEncodeMapToJson()
  @Wrap(const [#jsonEncoder,#postgresDb])
  Future<List> getById(@Input(PostgresDb) Connection db, int id) async {
    Adapter _adapter = new PgAdapter.FromConnection(db);
    bean = new TemaBean(_adapter);
    Stream<Tema> stream = await bean.findById(id);
    return stream.toList();
  }
}

///Grupo de rutas de tipo
@RouteGroup(path: '/tipo')
class TipoRouteGroup{
  TipoBean bean;
  WrapEncodeToJson jsonEncoder() => new WrapEncodeToJson();
  WrapPostgresDb postgresDb() => new WrapPostgresDb(campusConnection);
  WrapEncodeJsonableList jsonableList() => new WrapEncodeJsonableList();

  ///devuelve todos los tipos
  @Get()
  //@WrapPostgresDb(campusConnection) // ignore: const_with_non_constant_argument
  //@WrapEncodeJsonableList()
  @Wrap(const [#jsonableList,#postgresDb])
  Future<List> getAll(@Input(PostgresDb) Connection db) async {
    Adapter _adapter = new PgAdapter.FromConnection(db);
    bean = new TipoBean(_adapter);
    Stream<Tipo> stream = await bean.findAll();
    return stream.toList();
  }

  ///devuelve un tipo por id
  @Get(path: '/:id', pathRegEx: const {'id': r'^[0-9]+$'})
  //@WrapPostgresDb(campusConnection) // ignore: const_with_non_constant_argument
  //@WrapEncodeMapToJson()
  @Wrap(const [#jsonEncoder,#postgresDb])
  Future<List> getById(@Input(PostgresDb) Connection db, int id) async {
    Adapter _adapter = new PgAdapter.FromConnection(db);
    bean = new TipoBean(_adapter);
    Stream<Tipo> stream = await bean.findById(id);
    return stream.toList();
  }
}

///Grupo de rutas de tipo
@RouteGroup(path: '/ponente')
class PonenteRouteGroup{
  ContenidoBean bean;
  WrapEncodeToJson jsonEncoder() => new WrapEncodeToJson();
  WrapPostgresDb postgresDb() => new WrapPostgresDb(campusConnection);
  WrapEncodeJsonableList jsonableList() => new WrapEncodeJsonableList();

  ///devuelve todos los tipos
  @Get()
  //@WrapPostgresDb(campusConnection) // ignore: const_with_non_constant_argument
  //@WrapEncodeJsonableList()
  @Wrap(const [#jsonableList,#postgresDb])
  Future<List> getAll(@Input(PostgresDb) Connection db) async {
    Adapter _adapter = new PgAdapter.FromConnection(db);
    bean = new ContenidoBean(_adapter);
    Stream lista = await bean.findAllPonentes();
    return lista.toList();
  }
}

///Api de campus
///
/// Clase general que contiene la creacion de la url de conexion a la base de
/// datos y contiene todos los RouteGroups de la api
@Api(path: '/campus')
class CampusApi{
  CampusApi(String user, String pass, String url, String name) {
    if (pass != null) {
      campusConnection = 'postgres://$user:$pass@$url/$name';
    } else {
      campusConnection = 'postgres://$user@$url/$name';
    }
  }

  @Group()
  final ContenidoRouteGroup contenidoRoutes = new ContenidoRouteGroup();

  @Group()
  final EventoRouteGroup eventoRoutes = new EventoRouteGroup();

  @Group()
  final FormatoRouteGroup formatoRoutes = new FormatoRouteGroup();

  @Group()
  final PlataformaRouteGroup plataformaRoutes = new PlataformaRouteGroup();

  @Group()
  final TemaRouteGroup temaRoutes = new TemaRouteGroup();

  @Group()
  final TipoRouteGroup tipoRoutes = new TipoRouteGroup();

  @Group()
  final PonenteRouteGroup ponenteRoutes = new PonenteRouteGroup();

  @Route(path: '/version', methods: const ['GET'])
  num version() => 1.0;
}
