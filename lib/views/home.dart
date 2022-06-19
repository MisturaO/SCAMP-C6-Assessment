import 'package:flutter/material.dart';
import 'package:recipee_list/views/widgets/recipe_card.dart';
import 'package:recipee_list/models/recipe.dart';
import 'package:recipee_list/models/recipe.api.dart..dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipees = [];
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecipees();
  }

  Future<void> getRecipees() async {
    _recipees = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant),
            SizedBox(width: 10),
            Text('Food Recipe')
          ],
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _recipees.length,
              itemBuilder: (context, index) {
                return RecipeCard(
                    id: _recipees[index].id,
                    name: _recipees[index].name,
                    ingredients: _recipees[index].ingredients,
                    steps: _recipees[index].steps,
                    image: _recipees[index].image);
              },
            ),
    );
  }
}
