@TestOn("vm")
import 'dart:convert';
import 'dart:io';
import 'package:campusAPI/api.dart';

import 'package:jaguar/jaguar.dart';
import 'package:jaguar/jaguar.dart' as jaguar;
import "package:test/test.dart";
import 'package:http/http.dart' as http;

main() {
  Jaguar jaguarApi;
  setUpAll(() async {
    final CampusApi ca = new CampusApi(
        jaguar.Settings.getString('dbuser'),
        jaguar.Settings.getString('dbpass'),
        jaguar.Settings.getString('dburl'),
        jaguar.Settings.getString('dbname'));
    int port = int.parse(jaguar.Settings.getString('test_svport'));
    jaguarApi = new Jaguar(multiThread: true, port: port);
    jaguarApi.addApi(new JaguarCampusApi.from(ca));
    await jaguarApi.serve();
  });
  tearDownAll(() async {
    jaguarApi.close();
  });
  group("Routes", () {
    group("Contenido", () {
      test("GET /", () async {
        Uri uri = new Uri.http(
            'localhost:' + jaguar.Settings.getString('test_svport'),
            'campus/contenido');
        http.Response response = await http.get(uri);
        List responseJson = JSON.decode(response.body);

        expect(response.statusCode, 200);
        responseJson.forEach((Map responseMap) {
          expect(responseMap.containsKey("id"), true);
          expect(responseMap['id'] is int, true);
          expect(responseMap.containsKey("titulo"), true);
          expect(responseMap["titulo"] is String, true);
          expect(responseMap.containsKey("descripcion"), true);
          expect(responseMap["descripcion"] is String, true);
          expect(responseMap.containsKey("formato"), true);
          expect(responseMap["formato"] is Map, true);
          expect(responseMap.containsKey("evento"), true);
          expect(responseMap["evento"] is Map, true);
          expect(responseMap.containsKey("tipo"), true);
          expect(responseMap["tipo"] is Map, true);
          expect(responseMap.containsKey("aparece"), true);
          expect(responseMap["aparece"] is String, true);
          expect(responseMap.containsKey("url"), true);
          expect(responseMap["url"] is String, true);
          expect(responseMap.containsKey("plataforma"), true);
          expect(responseMap["plataforma"] is Map, true);
          expect(responseMap.containsKey("thumbnail"), true);
          expect(responseMap["thumbnail"] is String, true);
          expect(responseMap.containsKey("temas"), true);
          expect(responseMap["temas"] is List, true);
        });
        expect(response.isRedirect, false);
        expect(response.headers[HttpHeaders.CONTENT_TYPE],
            'application/json; charset=utf-8');
      });
      test("GET /:id", () async {
        Uri uri = new Uri.http(
            'localhost:' + jaguar.Settings.getString('test_svport'),
            'campus/contenido/1');
        http.Response response = await http.get(uri);
        Map responseJson = JSON.decode(response.body);

        expect(response.statusCode, 200);
        expect(responseJson.containsKey("id"), true);
        expect(responseJson['id'] is int, true);
        expect(responseJson.containsKey("titulo"), true);
        expect(responseJson["titulo"] is String, true);
        expect(responseJson.containsKey("descripcion"), true);
        expect(responseJson["descripcion"] is String, true);
        expect(responseJson.containsKey("formato"), true);
        expect(responseJson["formato"] is Map, true);
        expect(responseJson.containsKey("evento"), true);
        expect(responseJson["evento"] is Map, true);
        expect(responseJson.containsKey("tipo"), true);
        expect(responseJson["tipo"] is Map, true);
        expect(responseJson.containsKey("aparece"), true);
        expect(responseJson["aparece"] is String, true);
        expect(responseJson.containsKey("url"), true);
        expect(responseJson["url"] is String, true);
        expect(responseJson.containsKey("plataforma"), true);
        expect(responseJson["plataforma"] is Map, true);
        expect(responseJson.containsKey("thumbnail"), true);
        expect(responseJson["thumbnail"] is String, true);
        expect(responseJson.containsKey("temas"), true);
        expect(responseJson["temas"] is List, true);
        expect(response.isRedirect, false);
        expect(response.headers[HttpHeaders.CONTENT_TYPE],
            'application/json; charset=utf-8');
      });
      test("GET /:id error with letters", () async {
        Uri uri = new Uri.http(
            'localhost:' + jaguar.Settings.getString('test_svport'),
            'campus/contenido/asdf');
        http.Response response = await http.get(uri);

        expect(response.statusCode, 404);
      });
      test("GET /count", () async {
        Uri uri = new Uri.http(
            'localhost:' + jaguar.Settings.getString('test_svport'),
            'campus/contenido/count');
        http.Response response = await http.get(uri);
        Map responseJson = JSON.decode(response.body);

        expect(response.statusCode, 200);
        expect(responseJson.containsKey("count"), true);
        expect(responseJson["count"] is int, true);
        expect(response.isRedirect, false);
      });
    });
    group("Evento", () {
      test("GET /", () async {
        Uri uri = new Uri.http(
            'localhost:' + jaguar.Settings.getString('test_svport'),
            'campus/evento');
        http.Response response = await http.get(uri);
        List responseJson = JSON.decode(response.body);

        expect(response.statusCode, 200);
        responseJson.forEach((Map responseMap) {
          expect(responseMap.containsKey("id"), true);
          expect(responseMap['id'] is int, true);
          expect(responseMap.containsKey("nombre"), true);
          expect(responseMap["nombre"] is String, true);
          expect(responseMap.containsKey("lugar"), true);
          expect(responseMap["lugar"] is String, true);
          expect(responseMap.containsKey("descripcion"), true);
          expect(responseMap["descripcion"] is String, true);
          expect(responseMap.containsKey("fecha"), true);
          expect(responseMap["fecha"] is String, true);
        });
        expect(response.isRedirect, false);
        expect(response.headers[HttpHeaders.CONTENT_TYPE],
            'application/json; charset=utf-8');
      });
      test("GET /:id", () async {
        Uri uri = new Uri.http(
            'localhost:' + jaguar.Settings.getString('test_svport'),
            'campus/evento/1');
        http.Response response = await http.get(uri);
        List responseJson = JSON.decode(response.body);

        expect(response.statusCode, 200);
        expect(responseJson[0].containsKey("id"), true);
        expect(responseJson[0]['id'] is int, true);
        expect(responseJson[0].containsKey("nombre"), true);
        expect(responseJson[0]["nombre"] is String, true);
        expect(responseJson[0].containsKey("lugar"), true);
        expect(responseJson[0]["lugar"] is String, true);
        expect(responseJson[0].containsKey("descripcion"), true);
        expect(responseJson[0]["descripcion"] is String, true);
        expect(responseJson[0].containsKey("fecha"), true);
        expect(responseJson[0]["fecha"] is String, true);
        expect(response.isRedirect, false);
        expect(response.headers[HttpHeaders.CONTENT_TYPE],
            'application/json; charset=utf-8');
      });
      test("GET /:id error with letters", () async {
        Uri uri = new Uri.http(
            'localhost:' + jaguar.Settings.getString('test_svport'),
            'campus/evento/asdf');
        http.Response response = await http.get(uri);

        expect(response.statusCode, 404);
      });
    });
    group("Formato", () {
      test("GET /", () async {
        Uri uri = new Uri.http(
            'localhost:' + jaguar.Settings.getString('test_svport'),
            'campus/formato');
        http.Response response = await http.get(uri);
        List responseJson = JSON.decode(response.body);

        expect(response.statusCode, 200);
        responseJson.forEach((Map responseMap) {
          expect(responseMap.containsKey("id"), true);
          expect(responseMap['id'] is int, true);
          expect(responseMap.containsKey("nombre"), true);
          expect(responseMap["nombre"] is String, true);
        });
        expect(response.isRedirect, false);
        expect(response.headers[HttpHeaders.CONTENT_TYPE],
            'application/json; charset=utf-8');
      });
      test("GET /:id", () async {
        Uri uri = new Uri.http(
            'localhost:' + jaguar.Settings.getString('test_svport'),
            'campus/formato/1');
        http.Response response = await http.get(uri);
        List responseJson = JSON.decode(response.body);

        expect(response.statusCode, 200);
        expect(responseJson[0].containsKey("id"), true);
        expect(responseJson[0]['id'] is int, true);
        expect(responseJson[0].containsKey("nombre"), true);
        expect(responseJson[0]["nombre"] is String, true);
        expect(response.isRedirect, false);
        expect(response.headers[HttpHeaders.CONTENT_TYPE],
            'application/json; charset=utf-8');
      });
      test("GET /:id error with letters", () async {
        Uri uri = new Uri.http(
            'localhost:' + jaguar.Settings.getString('test_svport'),
            'campus/evento/asdf');
        http.Response response = await http.get(uri);

        expect(response.statusCode, 404);
      });
    });
    group("Plataforma", () {
      test("GET /", () async {
        Uri uri = new Uri.http(
            'localhost:' + jaguar.Settings.getString('test_svport'),
            'campus/plataforma');
        http.Response response = await http.get(uri);
        List responseJson = JSON.decode(response.body);

        expect(response.statusCode, 200);
        responseJson.forEach((Map responseMap) {
          expect(responseMap.containsKey("id"), true);
          expect(responseMap['id'] is int, true);
          expect(responseMap.containsKey("nombre"), true);
          expect(responseMap["nombre"] is String, true);
        });
        expect(response.isRedirect, false);
        expect(response.headers[HttpHeaders.CONTENT_TYPE],
            'application/json; charset=utf-8');
      });
      test("GET /:id", () async {
        Uri uri = new Uri.http(
            'localhost:' + jaguar.Settings.getString('test_svport'),
            'campus/plataforma/1');
        http.Response response = await http.get(uri);
        List responseJson = JSON.decode(response.body);

        expect(response.statusCode, 200);
        expect(responseJson[0].containsKey("id"), true);
        expect(responseJson[0]['id'] is int, true);
        expect(responseJson[0].containsKey("nombre"), true);
        expect(responseJson[0]["nombre"] is String, true);
        expect(response.isRedirect, false);
        expect(response.headers[HttpHeaders.CONTENT_TYPE],
            'application/json; charset=utf-8');
      });
      test("GET /:id error with letters", () async {
        Uri uri = new Uri.http(
            'localhost:' + jaguar.Settings.getString('test_svport'),
            'campus/plataforma/asdf');
        http.Response response = await http.get(uri);

        expect(response.statusCode, 404);
      });
    });
    group("tema", () {
      test("GET /", () async {
        Uri uri = new Uri.http(
            'localhost:' + jaguar.Settings.getString('test_svport'),
            'campus/tema');
        http.Response response = await http.get(uri);
        List responseJson = JSON.decode(response.body);

        expect(response.statusCode, 200);
        responseJson.forEach((Map responseMap) {
          expect(responseMap.containsKey("id"), true);
          expect(responseMap['id'] is int, true);
          expect(responseMap.containsKey("nombre"), true);
          expect(responseMap["nombre"] is String, true);
        });
        expect(response.isRedirect, false);
        expect(response.headers[HttpHeaders.CONTENT_TYPE],
            'application/json; charset=utf-8');
      });
      test("GET /:id", () async {
        Uri uri = new Uri.http(
            'localhost:' + jaguar.Settings.getString('test_svport'),
            'campus/tema/1');
        http.Response response = await http.get(uri);
        List responseJson = JSON.decode(response.body);

        expect(response.statusCode, 200);
        expect(responseJson[0].containsKey("id"), true);
        expect(responseJson[0]['id'] is int, true);
        expect(responseJson[0].containsKey("nombre"), true);
        expect(responseJson[0]["nombre"] is String, true);
        expect(response.isRedirect, false);
        expect(response.headers[HttpHeaders.CONTENT_TYPE],
            'application/json; charset=utf-8');
      });
      test("GET /:id error with letters", () async {
        Uri uri = new Uri.http(
            'localhost:' + jaguar.Settings.getString('test_svport'),
            'campus/tema/asdf');
        http.Response response = await http.get(uri);

        expect(response.statusCode, 404);
      });
    });
    group("Tipo", () {
      test("GET /", () async {
        Uri uri = new Uri.http(
            'localhost:' + jaguar.Settings.getString('test_svport'),
            'campus/tipo');
        http.Response response = await http.get(uri);
        List responseJson = JSON.decode(response.body);

        expect(response.statusCode, 200);
        responseJson.forEach((Map responseMap) {
          expect(responseMap.containsKey("id"), true);
          expect(responseMap['id'] is int, true);
          expect(responseMap.containsKey("nombre"), true);
          expect(responseMap["nombre"] is String, true);
        });
        expect(response.isRedirect, false);
        expect(response.headers[HttpHeaders.CONTENT_TYPE],
            'application/json; charset=utf-8');
      });
      test("GET /:id", () async {
        Uri uri = new Uri.http(
            'localhost:' + jaguar.Settings.getString('test_svport'),
            'campus/tipo/1');
        http.Response response = await http.get(uri);
        List responseJson = JSON.decode(response.body);

        expect(response.statusCode, 200);
        expect(responseJson[0].containsKey("id"), true);
        expect(responseJson[0]['id'] is int, true);
        expect(responseJson[0].containsKey("nombre"), true);
        expect(responseJson[0]["nombre"] is String, true);
        expect(response.isRedirect, false);
        expect(response.headers[HttpHeaders.CONTENT_TYPE],
            'application/json; charset=utf-8');
      });
      test("GET /:id error with letters", () async {
        Uri uri = new Uri.http(
            'localhost:' + jaguar.Settings.getString('test_svport'),
            'campus/tipo/asdf');
        http.Response response = await http.get(uri);

        expect(response.statusCode, 404);
      });
    });
    test("version", () {
      var string = "  foo ";
      expect(string.trim(), equals("foo"));
    });
  });
}
