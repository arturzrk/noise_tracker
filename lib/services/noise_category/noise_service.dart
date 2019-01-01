import 'package:noise_recorder/model/noise_category.dart';

abstract class NoiseService {
  Future<String> create(NoiseCategory noiseCategory);
  Future update(NoiseCategory noiseCategory);
  Future delete(String noiseCategoryName);
  Stream<List<NoiseCategory>> getAll();
}