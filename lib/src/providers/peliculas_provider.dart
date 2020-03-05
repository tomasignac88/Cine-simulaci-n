import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:peliculas/src/models/pelicula_model.dart';

class PeliculasProvider {

  String _apikey = 'eafe8a5b256ec33402c92650bbbc2d51';
  String _url = 'api.themoviedb.org';
  String _languaje = 'es-ES';


  Future<List<Pelicula>> _procesarRespuesta(Uri url) async{
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body); //lo transforma en un mapa
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async{

    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key' : _apikey,
      'lenguaje': _languaje
    });

    return _procesarRespuesta(url);

  }

  

  Future<List<Pelicula>> getPopulares() async{

    final url = Uri.https(_url, '3/movie/popular', {
      'api_key' : _apikey,
      'lenguaje': _languaje
    });

    return _procesarRespuesta(url);

  }

}