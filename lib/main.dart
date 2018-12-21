import 'package:flutter/material.dart';
import 'package:noise_recorder/noise_categories.dart';
import 'package:noise_recorder/routes/settings_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noise-R',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Raleway",
      ),
      home: HomePage(
        title: 'Noise-R',
        noiseCategories: NoiseCategory.configuredCategories,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title, this.noiseCategories}) : super(key: key);

  final String title;
  final List<NoiseCategory> noiseCategories;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: onSettingsPressed,
          )
        ],
      ),
      body: buildButtonGrid(),
    );
  }

  GridView buildButtonGrid() {
    return GridView.count(
      crossAxisCount: 2,
      children: buildButtonsFromList(NoiseCategory.configuredCategories),
    );
  }

  List<Widget> buildButtonsFromList(List<NoiseCategory> noiseCategories) {
    return noiseCategories.map((category) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
            child: Text(
                category.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline),
            color: category.color != null
                ? category.color
                : Theme.of(context).buttonColor,
            onPressed: () {
              print("Button ${category.name} has been pressed.");
            }),
      );
    }).toList();
  }

  void onSettingsPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SettingsRoute(categories: NoiseCategory.configuredCategories);
    }));
    print("Setings pressed.");
  }
}
