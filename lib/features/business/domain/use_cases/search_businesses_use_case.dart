import 'package:tally_task/core/use_case.dart/use_case.dart';
import 'package:tally_task/core/util/type_def.dart';
import 'package:tally_task/features/business/domain/entities/business_entity.dart';
import 'package:tally_task/features/business/domain/repositories/business_repository.dart';

class SearchBusinessesUseCase
    implements UseCase<List<BusinessEntity>, SearchQueryParam> {
  final BusinessRepository _repository;

  SearchBusinessesUseCase({required BusinessRepository repository})
    : _repository = repository;

  @override
  Future<FailureOr<List<BusinessEntity>>> call(SearchQueryParam params) {
    return _repository.searchBusinesses(params.query);
  }
}

/// Parameters required for the [SearchBusinessUseCase].
typedef SearchQueryParam = ({String query});
