import '../models/helper/helper_model.dart';
import '../service/api_proider.dart';

class HelperRepository {
  HelperRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<List<HelperModel>> getLanguages() => apiProvider.getLanguages();

  Future<List<HelperModel>> getGenres() => apiProvider.getGenres();
}