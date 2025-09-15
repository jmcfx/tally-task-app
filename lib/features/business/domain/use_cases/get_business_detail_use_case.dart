
import 'package:tally_task/core/use_case.dart/use_case.dart';
import 'package:tally_task/core/util/type_def.dart';
import 'package:tally_task/features/business/domain/entities/business_entity.dart';
import 'package:tally_task/features/business/domain/repositories/business_repository.dart';

class GetBusinessDetailUseCase
    implements UseCase<BusinessEntity, GetBusinessDetailParams> {
  final BusinessRepository _repository;

  GetBusinessDetailUseCase({required BusinessRepository repository})
    : _repository = repository;

  @override
  Future<FailureOr<BusinessEntity>> call(GetBusinessDetailParams params) async {
    return _repository.getBusinessDetail(params.businessId);
  }
}

/// Parameters required for the [GetBusinessDetailUseCase].
typedef GetBusinessDetailParams  = ({String businessId});