import 'package:flutter/material.dart';
import 'package:noise_recorder/noise_categories.dart';

class CategoryRoute extends StatefulWidget {
  final NoiseCategory category;

  CategoryRoute({@required this.category}) : assert(category != null);

  @override
  CategoryRouteState createState() {
    // TODO: implement createState
    return CategoryRouteState();
  }
}

class CategoryRouteState extends State<CategoryRoute> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Noise Category"),
      ),
      body: ListView(
        children: [
          TextFormField(
            initialValue: widget.category.name,
          )
        ],
      ),
    );
  }
}
