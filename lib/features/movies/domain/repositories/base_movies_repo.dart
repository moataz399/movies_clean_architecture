import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/movie.dart';

abstract class BaseMoviesRepo {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  // Future<Either<Failure, MovieDetail>> getMovieDetails(
  //     MovieDetailsParameters parameters);
  //
  // Future<Either<Failure, List<Recommendation>>> getRecommendation(
  //     RecommendationParameters parameters);
}
