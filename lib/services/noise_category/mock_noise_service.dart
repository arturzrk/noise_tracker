import 'package:noise_recorder/model/noise_category.dart';
import 'package:noise_recorder/services/noise_category/noise_service.dart';

class MockNoiseService implements NoiseService {
  final List<NoiseCategory> _noises = NoiseCategory.configuredCategories;

  @override
  Future<String> create(NoiseCategory noiseCategory) async {
    // TODO: implement create
    _noises.add(noiseCategory);
    return noiseCategory.name;
  }

  @override
  Future delete(String noiseCategoryName) async {
    _noises.removeWhere((element) {
      return element.name == noiseCategoryName;
    });
  }

  @override
  Stream<List<NoiseCategory>> getAll() async* {
    yield _noises;
  }

  @override
  Future update(NoiseCategory noiseCategory) async {
    _noises[_noises.indexWhere((element) {
      return element.name == noiseCategory.name;
    })] = noiseCategory;
  }
}
