@TestOn('vm')
import 'package:test/test.dart';
import 'package:campusAPI/db/db.dart';
import 'package:jaguar/jaguar.dart' as jaguar;

main() {
  PgAdapter adapter;
  setUpAll(() async {
    await jaguar.Settings.parse(["-s", "settings.yaml"]);
    adapter = new PgAdapter(
        'postgres://${jaguar.Settings.getString("dbuser")}:${jaguar.Settings.getString('dbpass')}@${jaguar.Settings.getString('dburl')}/${jaguar.Settings.getString('dbname')}');
    adapter.connect();
  });
  group('Beans', () {
    group('contenido', () {
      ContenidoBean bean;
      setUpAll(() {
        bean = new ContenidoBean(adapter);
      });
      test("findWithOptionals", () async {
        expect(bean.findWithOptionals(5, 0), completion(isList));
      });
      test("findById", () async {
        expect(bean.findById(1), completion(isMap));
      });
      test("findAllPonentes", () async {
        expect(bean.findAllPonentes(),
            completion(emits(new isInstanceOf<Contenido>())));
      });
      test("getCount", () async {
        expect(bean.getCount(), completion(isMap));
      });
      test("getEventoFromId", () async {
        expect(bean.getEventoFromId(1), completion(new isInstanceOf<Evento>()));
      });
      test("getFormatoFromId", () async {
        expect(
            bean.getFormatoFromId(1), completion(new isInstanceOf<Formato>()));
      });
      test("getPlataformaFromId", () async {
        expect(bean.getPlataformaFromId(1),
            completion(new isInstanceOf<Plataforma>()));
      });
      test("getTemaFromId", () async {
        expect(bean.getTemaFromId(1), completion(new isInstanceOf<Tema>()));
      });
      test("getTipoFromId", () async {
        expect(bean.getTipoFromId(1), completion(new isInstanceOf<Tipo>()));
      });
      test("getPlataformaFromId", () async {
        expect(bean.getPlataformaFromId(1),
            completion(new isInstanceOf<Plataforma>()));
      });
    });
    group("contenido_tiene_tema", () {
      ContenidoTieneTemaBean bean;
      setUpAll(() {
        bean = new ContenidoTieneTemaBean(adapter);
      });
      test("FindAll", () async {
        expect(bean.findAll(),
            completion(emits(new isInstanceOf<ContenidoTieneTema>())));
      });
      test("FindById", () async {
        expect(bean.findById(1),
            completion(emits(new isInstanceOf<ContenidoTieneTema>())));
      });
      test("findTemaFromContenido", () async {
        expect(bean.findTemaFromContenido(1),
            completion(emits(new isInstanceOf<ContenidoTieneTema>())));
      });
    });
    group("tema", () {
      TemaBean bean;
      setUpAll(() {
        bean = new TemaBean(adapter);
      });
      test("FindAll", () async {
        expect(bean.findAll(), completion(emits(new isInstanceOf<Tema>())));
      });
      test("FindById", () async {
        expect(bean.findById(1), completion(emits(new isInstanceOf<Tema>())));
      });
    });
    group("plataforma", () {
      PlataformaBean bean;
      setUpAll(() {
        bean = new PlataformaBean(adapter);
      });
      test("FindAll", () async {
        expect(
            bean.findAll(), completion(emits(new isInstanceOf<Plataforma>())));
      });
      test("FindById", () async {
        expect(bean.findById(1),
            completion(emits(new isInstanceOf<Plataforma>())));
      });
    });
    group("tipo", () {
      TipoBean bean;
      setUpAll(() {
        bean = new TipoBean(adapter);
      });
      test("FindAll", () async {
        expect(bean.findAll(), completion(emits(new isInstanceOf<Tipo>())));
      });
      test("FindById", () async {
        expect(bean.findById(1), completion(emits(new isInstanceOf<Tipo>())));
      });
    });
    group("evento", () {
      EventoBean bean;
      setUpAll(() {
        bean = new EventoBean(adapter);
      });
      test("FindAll", () async {
        expect(bean.findAll(), completion(emits(new isInstanceOf<Evento>())));
      });
      test("FindById", () async {
        expect(bean.findById(1), completion(emits(new isInstanceOf<Evento>())));
      });
    });
    group("formato", () {
      FormatoBean bean;
      setUpAll(() {
        bean = new FormatoBean(adapter);
      });
      test("FindAll", () async {
        expect(bean.findAll(), completion(emits(new isInstanceOf<Formato>())));
      });
      test("FindById", () async {
        expect(
            bean.findById(1), completion(emits(new isInstanceOf<Formato>())));
      });
    });
  });
  tearDownAll(() {
    adapter.close();
  });
}
