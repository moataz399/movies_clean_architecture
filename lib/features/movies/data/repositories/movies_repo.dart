import 'package:dartz/dartz.dart';
import 'package:movies_clean_acrh/core/errors/failure.dart';

import '../../../../core/errors/exception.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/base_movies_repo.dart';
import '../datasource/remote_data_source.dart';

class MoviesRepository extends BaseMoviesRepo {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    try {
      final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final result = await baseMovieRemoteDataSource.getPopularMovies();

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try {
      final result = await baseMovieRemoteDataSource.getTopRatedMovies();

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

// @override
// Future<Either<Failure, MovieDetail>> getMovieDetails(
//     MovieDetailsParameters parameters) async {
//   final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
//   try {
//     return Right(result);
//   } on ServerException catch (failure) {
//     return Left(ServerFailure(failure.errorMessageModel.statusMessage));
//   }
// }
//
// @override
// Future<Either<Failure, List<Recommendation>>> getRecommendation(
//     RecommendationParameters parameters) async {
//   final result =
//   await baseMovieRemoteDataSource.getRecommendation(parameters);
//   try {
//     return Right(result);
//   } on ServerException catch (failure) {
//     return Left(ServerFailure(failure.errorMessageModel.statusMessage));
//   }
// }
}
