import 'package:books_progect/data/models/helper/helper_model.dart';
import 'package:books_progect/data/service/api_proider.dart';

class PublisherRepository{
  PublisherRepository({required this.apiProvider});

  final ApiProvider apiProvider;


  Future<List<HelperModel>> getAllPublisher() =>apiProvider.getAllPublisher();

  Future<HelperModel> getPublisherById({required int id})=> apiProvider.getPublisherById(id: id);

  Future<HelperModel> putPublisher({required int id, required String name})=> apiProvider.putPublisher(id: id, name: name);

  Future<bool> deletePublisherById({required int id}) => apiProvider.deletePublisherById(id: id);

  Future<HelperModel> postPublisher({required String name}) => apiProvider.postPublisher(name: name);
  }