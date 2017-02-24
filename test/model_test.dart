@TestOn('vm')
import 'package:test/test.dart';
import 'package:campusAPI/db/db.dart';

main() {
  group("model", () {
    group("contenido", () {
      Contenido contenido;
      ContenidoJsonSerializer serializer;
      setUpAll(() {
        serializer = new ContenidoJsonSerializer();
      });
      setUp(() {
        contenido = new Contenido()
          ..aparece = "aparece"
          ..descripcion = "descripcion"
          ..evento = 0
          ..formato = 0
          ..plataforma = 0
          ..thumbnail = "thumbnail"
          ..tipo = 0
          ..titulo = "titulo"
          ..id = 0;
      });
      test('To Map', () {
        Map result = serializer.toMap(contenido);
        expect(result, containsPair('aparece', 'aparece'));
        expect(result, containsPair('id', 0));
        expect(result, containsPair('descripcion', 'descripcion'));
        expect(result, containsPair('evento', 0));
        expect(result, containsPair('formato', 0));
        expect(result, containsPair('plataforma', 0));
        expect(result, containsPair('thumbnail', 'thumbnail'));
        expect(result, containsPair('tipo', 0));
        expect(result, containsPair('titulo', 'titulo'));
      });
      Map contenidoMap;
      setUp(() {
        contenidoMap = {
          'id': 0,
          'aparece': "aparece",
          'descripcion': "descripcion",
          'evento': 0,
          'formato': 0,
          'plataforma': 0,
          'thumbnail': "thumbnail",
          'tipo': 0,
          'titulo': "titulo"
        };
      });
      test('From Map', () {
        Contenido result = serializer.fromMap(contenidoMap);
        expect(result.id, isNotNull);
        expect(result.id, equals(0));
        expect(result.aparece, isNotNull);
        expect(result.aparece, equals('aparece'));
        expect(result.descripcion, isNotNull);
        expect(result.descripcion, equals('descripcion'));
        expect(result.evento, isNotNull);
        expect(result.evento, equals(0));
        expect(result.formato, isNotNull);
        expect(result.formato, equals(0));
        expect(result.plataforma, isNotNull);
        expect(result.plataforma, equals(0));
        expect(result.thumbnail, isNotNull);
        expect(result.thumbnail, equals('thumbnail'));
        expect(result.tipo, isNotNull);
        expect(result.tipo, equals(0));
        expect(result.titulo, isNotNull);
        expect(result.titulo, equals('titulo'));
      });
    });
    group("contenido_tiene_tema", () {
      ContenidoTieneTema contenido_tiene_tema;
      ContenidoTieneTemaJsonSerializer serializer;
      setUpAll(() {
        serializer = new ContenidoTieneTemaJsonSerializer();
      });
      setUp(() {
        contenido_tiene_tema = new ContenidoTieneTema()
          ..id = 0
          ..contenido = 0
          ..tema = 0;
      });
      test('To Map', () {
        Map result = serializer.toMap(contenido_tiene_tema);
        expect(result, containsPair('id', 0));
        expect(result, containsPair('contenido', 0));
        expect(result, containsPair('tema', 0));
      });
      Map contenido_tiene_temaMap;
      setUp(() {
        contenido_tiene_temaMap = {
          'id': 0,
          'contenido': 0,
          'tema': 0,
        };
      });
      test('From Map', () {
        ContenidoTieneTema result = serializer.fromMap(contenido_tiene_temaMap);
        expect(result.id, isNotNull);
        expect(result.id, equals(0));
        expect(result.contenido, isNotNull);
        expect(result.contenido, equals(0));
        expect(result.tema, isNotNull);
        expect(result.tema, equals(0));
      });
    });
    group("evento", () {
      Evento contenido_tiene_tema;
      EventoJsonSerializer serializer;
      setUpAll(() {
        serializer = new EventoJsonSerializer();
      });
      setUp(() {
        contenido_tiene_tema = new Evento()
          ..id = 0
          ..nombre = 'nombre'
          ..lugar = 'lugar'
          ..descripcion = 'descripcion'
          ..fecha = 'fecha';
      });
      test('To Map', () {
        Map result = serializer.toMap(contenido_tiene_tema);
        expect(result, containsPair('id', 0));
        expect(result, containsPair('nombre', 'nombre'));
        expect(result, containsPair('lugar', 'lugar'));
        expect(result, containsPair('descripcion', 'descripcion'));
        expect(result, containsPair('fecha', 'fecha'));
      });
      Map eventoMap;
      setUp(() {
        eventoMap = {
          'id': 0,
          'nombre': 'nombre',
          'lugar': 'lugar',
          'descripcion': 'descripcion',
          'fecha': 'fecha',
        };
      });
      test('From Map', () {
        Evento result = serializer.fromMap(eventoMap);
        expect(result.id, isNotNull);
        expect(result.id, equals(0));
        expect(result.nombre, isNotNull);
        expect(result.nombre, equals('nombre'));
        expect(result.lugar, isNotNull);
        expect(result.lugar, equals('lugar'));
        expect(result.descripcion, isNotNull);
        expect(result.descripcion, equals('descripcion'));
        expect(result.fecha, isNotNull);
        expect(result.fecha, equals('fecha'));
      });
    });
    group("formato", () {
      Formato formato;
      FormatoJsonSerializer serializer;
      setUpAll(() {
        serializer = new FormatoJsonSerializer();
      });
      setUp(() {
        formato = new Formato()
          ..id = 0
          ..nombre = 'nombre';
      });
      test('To Map', () {
        Map result = serializer.toMap(formato);
        expect(result, containsPair('id', 0));
        expect(result, containsPair('nombre', 'nombre'));
      });
      Map formatoMap;
      setUp(() {
        formatoMap = {
          'id': 0,
          'nombre': 'nombre',
        };
      });
      test('From Map', () {
        Formato result = serializer.fromMap(formatoMap);
        expect(result.id, isNotNull);
        expect(result.id, equals(0));
        expect(result.nombre, isNotNull);
        expect(result.nombre, equals('nombre'));
      });
    });
    group("plataforma", () {
      Plataforma plataforma;
      PlataformaJsonSerializer serializer;
      setUpAll(() {
        serializer = new PlataformaJsonSerializer();
      });
      setUp(() {
        plataforma = new Plataforma()
          ..id = 0
          ..nombre = 'nombre';
      });
      test('To Map', () {
        Map result = serializer.toMap(plataforma);
        expect(result, containsPair('id', 0));
        expect(result, containsPair('nombre', 'nombre'));
      });
      Map plataformaMap;
      setUp(() {
        plataformaMap = {
          'id': 0,
          'nombre': 'nombre',
        };
      });
      test('From Map', () {
        Plataforma result = serializer.fromMap(plataformaMap);
        expect(result.id, isNotNull);
        expect(result.id, equals(0));
        expect(result.nombre, isNotNull);
        expect(result.nombre, equals('nombre'));
      });
    });
    group("tema", () {
      Tema tema;
      TemaJsonSerializer serializer;
      setUpAll(() {
        serializer = new TemaJsonSerializer();
      });
      setUp(() {
        tema = new Tema()
          ..id = 0
          ..nombre = 'nombre';
      });
      test('To Map', () {
        Map result = serializer.toMap(tema);
        expect(result, containsPair('id', 0));
        expect(result, containsPair('nombre', 'nombre'));
      });
      Map temaMap;
      setUp(() {
        temaMap = {
          'id': 0,
          'nombre': 'nombre',
        };
      });
      test('From Map', () {
        Tema result = serializer.fromMap(temaMap);
        expect(result.id, isNotNull);
        expect(result.id, equals(0));
        expect(result.nombre, isNotNull);
        expect(result.nombre, equals('nombre'));
      });
    });
    group("tipo", () {
      Tipo tipo;
      TipoJsonSerializer serializer;
      setUpAll(() {
        serializer = new TipoJsonSerializer();
      });
      setUp(() {
        tipo = new Tipo()
          ..id = 0
          ..nombre = 'nombre';
      });
      test('To Map', () {
        Map result = serializer.toMap(tipo);
        expect(result, containsPair('id', 0));
        expect(result, containsPair('nombre', 'nombre'));
      });
      Map tipoMap;
      setUp(() {
        tipoMap = {
          'id': 0,
          'nombre': 'nombre',
        };
      });
      test('From Map', () {
        Tipo result = serializer.fromMap(tipoMap);
        expect(result.id, isNotNull);
        expect(result.id, equals(0));
        expect(result.nombre, isNotNull);
        expect(result.nombre, equals('nombre'));
      });
    });
  });
}
