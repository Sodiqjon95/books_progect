import 'dart:io';

import 'package:books_progect/data/models/books/book_model.dart';
import 'package:books_progect/data/service/api_client.dart';
import 'package:dio/dio.dart';

import '../models/helper/helper_model.dart';

class ApiProvider {
  final ApiClient apiClient;
  ApiProvider({required this.apiClient});

  //--------------- Books API Call --------------------------

  Future<List<BookModel>> getAllBooks() async {
    Response response =
        await apiClient.dio.get("${apiClient.dio.options.baseUrl}/api/books");

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      List<BookModel> books = (response.data as List?)
              ?.map((e) => BookModel.fromJson(e))
              .toList() ??
          [];
      return books;
    } else {
      throw Exception();
    }
  }

  Future<BookModel> getBookById({required int id}) async {
    Response response = await apiClient.dio
        .get("${apiClient.dio.options.baseUrl}/api/books/$id");
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return BookModel.fromJson(response.data);
    } else {
      throw Exception();
    }
  }

  Future<BookModel> addBook({required BookModel bookModel}) async {
    Response response = await apiClient.dio
        .post("${apiClient.dio.options.baseUrl}/api/books", data: {
      "title": bookModel.title,
      "publishYear": bookModel.publishYear,
      "numberOfPages": bookModel.numberOfPages,
      "publisherId": bookModel.publisherId,
      "price": bookModel.price,
      "genre": bookModel.genre,
      "language": bookModel.language
    });
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return BookModel.fromJson(response.data);
    } else {
      throw Exception();
    }
  }

  Future<bool> deleteBookById({required int id}) async {
    Response response = await apiClient.dio.delete(
      "${apiClient.dio.options.baseUrl}/api/books",
      queryParameters: {"id": id},
    );
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return response.data as bool;
    } else {
      throw Exception();
    }
  }

  Future<BookModel> updatePatch({
    required String title,
    required int publishYear,
    required int numberOfPages,
    required int price,
    required int id,
  }) async {
    Response response = await apiClient.dio
        .patch("${apiClient.dio.options.baseUrl}/api/books", queryParameters: {
      "id": id
    }, data: {
      "title": title,
      "publishYear": publishYear,
      "numberOfPages": numberOfPages,
      "price": price,
    });
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return BookModel.fromJson(response.data);
    } else {
      throw Exception();
    }
  }

  // -------------------------- Helper API CALL -------------------------------

  Future<List<HelperModel>> getLanguages() async {
    Response response = await apiClient.dio
        .get("${apiClient.dio.options.baseUrl}/api/books/languages");

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      List<HelperModel> languages = (response.data as List?)
              ?.map((e) => HelperModel.fromJson(e))
              .toList() ??
          [];
      return languages;
    } else {
      throw Exception();
    }
  }

  Future<List<HelperModel>> getGenres() async {
    Response response = await apiClient.dio
        .get("${apiClient.dio.options.baseUrl}/api/books/genres");

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      List<HelperModel> languages = (response.data as List?)
              ?.map((e) => HelperModel.fromJson(e))
              .toList() ??
          [];
      return languages;
    } else {
      throw Exception();
    }
  }



  // --------------publisher-------------
  Future<List<HelperModel>> getAllPublisher() async {
    try {
      Response response = await apiClient.dio
          .get(("${apiClient.dio.options.baseUrl}/api/publishers"));

      if (response.statusCode == HttpStatus.ok) {
        List<HelperModel> publishers = (response.data as List)
            .map((e) => HelperModel.fromJson(e))
            .toList();

        return publishers;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<HelperModel> getPublisherById({required int id}) async {
    try {
      Response response = await apiClient.dio.get(
        "${apiClient.dio.options.baseUrl}/api/publisher/$id",
      );
      if (response.statusCode == HttpStatus.ok) {
        return HelperModel.fromJson(response.data);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<HelperModel> putPublisher(
      {required int id, required String name}) async {
    Response response = await apiClient.dio.put(
        "${apiClient.dio.options.baseUrl}/api/publishers",
        queryParameters: {"id": id},
        data: {"name": name});
    if (response.statusCode == HttpStatus.ok) {
      return HelperModel.fromJson(response.data);
    } else {
      throw Exception();
    }
  }

  Future<bool> deletePublisherById({required int id}) async {
    Response response = await apiClient.dio.delete(
        "${apiClient.dio.options.baseUrl}/api/publishers",
        queryParameters: {"id": id});
    if (response.statusCode == HttpStatus.ok) {
      return  response.data as bool;
    } else {
      throw Exception();
    }
  }



  Future<HelperModel> postPublisher({required String name}) async {
    Response response = await apiClient.dio.post(
      "${apiClient.dio.options.baseUrl}/api/publishers",
      data: {"name": name},
    );
    if (response.statusCode == HttpStatus.ok) {
      return HelperModel.fromJson(response.data);
    } else {
      throw Exception();
    }
  }
}
