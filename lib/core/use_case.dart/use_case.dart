import 'package:tally_task/core/util/type_def.dart';
/// This takes [Params] as input and returns Either Failure or [DataType]
mixin UseCase<DataType, Params> {
  Future<FailureOr<DataType>> call(Params params);
}
/// use_case that don't take params || 
/// used records because then are immutable and have prebuilt Deep equality..
typedef NoParams = ();
