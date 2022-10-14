import '../models/songs.dart';
import 'package:http/http.dart' as http;
class API {
  getSongFromApi() async{
    final url = Uri.parse('https://api.deezer.com/playlist/10149128982/tracks');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return songFromJson(json);
    } else {
      return [];
    }
  }
}