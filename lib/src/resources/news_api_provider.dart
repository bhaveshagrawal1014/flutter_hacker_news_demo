import 'package:http/http.dart' show Client;
import 'dart:async';
import '../models/item_model.dart';
import 'dart:convert';
import 'repository.dart';

final _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider implements Source {

  Client client = Client();

  Future<List<int>> fetchTopIds() async {
    final response = await client.get("$_root/topstories.json");
    return json.decode(response.body).cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    final response = await client.get("$_root/item/$id.json");
    return ItemModel.fromJson(json.decode(response.body));
  }

}