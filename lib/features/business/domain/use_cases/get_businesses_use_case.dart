import 'package:tally_task/core/use_case.dart/use_case.dart';
import 'package:tally_task/core/util/type_def.dart';
import 'package:tally_task/features/business/domain/entities/business_entity.dart';
import 'package:tally_task/features/business/domain/repositories/business_repository.dart';

class GetBusinessesUseCase implements UseCase<List<BusinessEntity>, NoParams> {
  final BusinessRepository _repository;

  GetBusinessesUseCase({required BusinessRepository repository})
    : _repository = repository;

  @override
  Future<FailureOr<List<BusinessEntity>>> call(NoParams params) {
    return _repository.getBusinesses();
  }
}
