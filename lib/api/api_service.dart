import 'package:chopper/chopper.dart';
import 'package:flutter_projects/converters/json_serializable_converter.dart';
import 'package:flutter_projects/models/anime.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: '/anime')
abstract class ApiService extends ChopperService {
  @Get(headers: {
    'X-RapidAPI-Key': '8d1c079557mshfad6e967741145dp1026f1jsnf8e1854363fb',
    'X-RapidAPI-Host': 'anime-db.p.rapidapi.com'
  })
  Future<Response<Anime>> getAllAnimes(
      {@Query('page') String page = '1', @Query('size') String size = '10'});

  static ApiService create() {
    final client = ChopperClient(
        baseUrl: Uri.parse('https://anime-db.p.rapidapi.com'),
        services: [_$ApiService()],
        converter: const JsonSerializableConverter({
          Anime: Anime.fromJson,
        }));
    return _$ApiService(client);
  }
}
