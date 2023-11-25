
import 'package:dartz/dartz.dart';
import 'package:movies_clean_acrh/core/errors/failure.dart';
import 'package:movies_clean_acrh/features/movies/domain/repositories/base_movies_repo.dart';

import '../entities/movie.dart';

class GetPopularMoviesUseCase {

  final BaseMoviesRepo baseMoviesRepo;

  GetPopularMoviesUseCase(this.baseMoviesRepo);



  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMoviesRepo.getPopularMovies();
  }
}