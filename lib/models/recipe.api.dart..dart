import 'dart:async';
import 'dart:convert';
import 'package:recipee_list/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var recipeApiUrl =
        "https://d17h27t6h515a5.cloudfront.net/topher/2017/May/59121517_baking/baking.json";
    http.Response response = await http.get(Uri.parse(recipeApiUrl));

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['steps']) {
      _temp.add(i['id']['description']);
    }
    return Recipe.recipesFromSnapshot(_temp);
  }
}
