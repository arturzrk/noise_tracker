import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:noise_recorder/app_config.dart';
import 'package:noise_recorder/model/noise_category.dart';
import 'package:noise_recorder/routes/settings_route.dart';
import 'package:noise_recorder/services/noise_category/noise_service.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    return MaterialApp(
      title: config.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Raleway",
      ),
      home: HomePage(
        title: config.appTitle,
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

  final NoiseService _noiseService = Injector.getInjector().get<NoiseService>();

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
      body: buildBody(),
    );
  }

  Widget buildButtonGrid(List<NoiseCategory> _categories) {
    return GridView.count(
      crossAxisCount: 2,
      children: buildButtonsFromList(_categories),
    );
  }

  Widget buildBody() {
    return StreamBuilder<List<NoiseCategory>>(
      stream: _noiseService.getAll(),
      builder: (context, snapshot) {
        if(!snapshot.hasData)
          return
            LinearProgressIndicator();
        return buildButtonGrid(snapshot.data);
      }
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
