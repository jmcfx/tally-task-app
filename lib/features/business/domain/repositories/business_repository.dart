import 'package:tally_task/core/util/type_def.dart';
import 'package:tally_task/features/business/domain/entities/business_entity.dart';

abstract interface class BusinessRepository {
  Future<FailureOr<List<BusinessEntity>>> getBusinesses();
   Future<FailureOr<BusinessEntity>> getBusinessDetail(String name);
   Future<FailureOr<List<BusinessEntity>>> searchBusinesses(String query);
  
}
