import 'package:flutter/material.dart';
import '../dummy_data.dart';

// Where we Explain the details of meal
class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/MealDetailsScreen';

  final Function isFavorite;
  final Function toggleFavorite;

  MealDetailsScreen({this.isFavorite, this.toggleFavorite});

  Widget buildTitleSection(BuildContext context, String text) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildDetailsContainer({Widget child}) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      height: 125,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealsDetails =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final selectedMela = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealsDetails['id'];
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            selectedMela.title,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(selectedMela.imageUrl),
              ),
              buildTitleSection(context, 'ingredients'),
              buildDetailsContainer(
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      margin: const EdgeInsets.all(5),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          selectedMela.ingredients[index],
                        ),
                      ),
                    );
                  },
                  itemCount: selectedMela.ingredients.length,
                ),
              ),
              buildTitleSection(context, 'Steps'),
              buildDetailsContainer(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(context).accentColor,
                            child: Text(
                              '# ${index + 1}',
                            ),
                          ),
                          title: Text(
                            selectedMela.steps[index],
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  },
                  itemCount: selectedMela.steps.length,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            toggleFavorite(selectedMela.id);
          },
          child: Icon(
            isFavorite(selectedMela.id) ? Icons.star : Icons.star_border,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
