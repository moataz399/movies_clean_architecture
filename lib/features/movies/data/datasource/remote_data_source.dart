import 'package:dio/dio.dart';
import 'package:movies_clean_acrh/core/errors/exception.dart';
import 'package:movies_clean_acrh/core/network/error_message_model.dart';
import 'package:movies_clean_acrh/core/utils/app_constants.dart';

import '../models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

// Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);

// Future<List<RecommendationModel>> getRecommendation(
//     RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {



  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(AppConstants.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }



@override
Future<List<MovieModel>> getPopularMovies() async {
  final response = await Dio().get(AppConstants.popularMoviesPath);

  if (response.statusCode == 200) {
    return List<MovieModel>.from((response.data["results"] as List).map(
          (e) => MovieModel.fromJson(e),
    ));
  } else {
    throw ServerException(
      errorMessageModel: ErrorMessageModel.fromJson(response.data),
    );
  }
}

@override
Future<List<MovieModel>> getTopRatedMovies() async {
  final response = await Dio().get(AppConstants.topRatedMoviesPath);

  if (response.statusCode == 200) {
    return List<MovieModel>.from((response.data["results"] as List).map(
          (e) => MovieModel.fromJson(e),
    ));
  } else {
    throw ServerException(
      errorMessageModel: ErrorMessageModel.fromJson(response.data),
    );
  }
}
//
// @override
// Future<MovieDetailsModel> getMovieDetails(
//     MovieDetailsParameters parameters) async {
//   final response =
//   await Dio().get(AppConstants.movieDetailsPath(parameters.movieId));
//
//   if (response.statusCode == 200) {
//     return MovieDetailsModel.fromJson(response.data);
//   } else {
//     throw ServerException(
//       errorMessageModel: ErrorMessageModel.fromJson(response.data),
//     );
//   }
// }
//
// @override
// Future<List<RecommendationModel>> getRecommendation(
//     RecommendationParameters parameters) async {
//   final response =
//   await Dio().get(AppConstants.recommendationPath(parameters.id));
//
//   if (response.statusCode == 200) {
//     return List<RecommendationModel>.from(
//         (response.data["results"] as List).map(
//               (e) => RecommendationModel.fromJson(e),
//         ));
//   } else {
//     throw ServerException(
//       errorMessageModel: ErrorMessageModel.fromJson(response.data),
//     );
//   }
// }
}
