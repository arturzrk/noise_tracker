import 'package:flutter/material.dart';
import 'package:noise_recorder/model/noise_category.dart';

class CategoryRoute extends StatefulWidget {
  final NoiseCategory category;

  CategoryRoute({@required this.category}) : assert(category != null);

  @override
  CategoryRouteState createState() {
    return CategoryRouteState();
  }
}

class CategoryRouteState extends State<CategoryRoute> {
  final TextEditingController _categoryInputController = TextEditingController();

  @override
  void initState() {
    _categoryInputController.text = widget.category.name;
    super.initState();
  }
  @override
  void dispose() {
    _categoryInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noise Category"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: _onCategorySubmitted,
          )
        ],
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 8.0),
                child: TextField(
                  autofocus: true,
                  controller: _categoryInputController,
                  textInputAction: TextInputAction.done,
                  style: Theme.of(context).textTheme.headline,
                  decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.title,
                    labelText: 'Category Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onSubmitted: (currentValue) => _onCategorySubmitted(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onCategorySubmitted() {
    setState(() {
      widget.category.name = _categoryInputController.text;
      Navigator.pop(context);
    });
  }
}
