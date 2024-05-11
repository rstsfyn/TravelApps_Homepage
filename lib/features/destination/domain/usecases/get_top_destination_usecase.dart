import 'package:course_travel/features/destination/domain/repositories/destination_repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/destination_entity.dart';
import '../../../../core/error/failures.dart';

class GetTopDestinationUseCase {
  final DestinationRepository _repository;

  GetTopDestinationUseCase(this._repository);

  Future<Either<Failure,List<DestinationEntity>>> call() {
    return _repository.top();
  }
}