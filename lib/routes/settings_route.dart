import 'package:flutter/material.dart';
import 'package:noise_recorder/model/noise_category.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:noise_recorder/routes/category_route.dart';

class SettingsRoute extends StatefulWidget {
  final List<NoiseCategory> categories;

  SettingsRoute({@required this.categories}) : assert(categories != null);

  @override
  SettingsRouteState createState() {
    return SettingsRouteState();
  }
}

class SettingsRouteState extends State<SettingsRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noise categories"),
      ),
      body: ListView(
        children: buildListItems(),
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            onPressed: () => onAddPressed(context),
            child: Icon(Icons.add),
          );
        }
      ),
    );
  }

  List<Widget> buildListItems() {
    final List<Widget> categoryTiles = <Widget>[];
    for (var category in widget.categories) {
      categoryTiles.add(Slidable(
        delegate: SlidableDrawerDelegate(),
        actionExtentRatio: 0.25,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              category.name,
              style: Theme.of(context).textTheme.headline,
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () => _categoryTapped(category),
          ),
        ),
        actions: _slideActions(category),
        secondaryActions: _slideActions(category),
      ));
    }
    return categoryTiles;
  }

  List<Widget> _slideActions(NoiseCategory category) {
    return <Widget>[
      IconSlideAction(
        color: Colors.red,
        caption: "Delete",
        icon: Icons.delete,
        onTap: () => _deleteCategory(category),
      ),
    ];
  }

  void _deleteCategory(NoiseCategory category) {
    setState(() {
      widget.categories.remove(category);
    });
    print("Category ${category.name} has been deleted.");
  }

  void _categoryTapped(NoiseCategory category) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CategoryRoute(category: category);
    }));
  }

  void onAddPressed(context) {
    NoiseCategory newCategory = NoiseCategory();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CategoryRoute(category: newCategory);
    }));
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Category added.'),
    ));
  }
}
