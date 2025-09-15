import 'package:tally_task/features/business/data/models/business_model.dart';

/// A Dart record representing a business entity.
/// Records are immutable and have built-in value-based equality.
typedef BusinessEntity = ({ String id , String name, String location, String contact});

/// Extension methods for [BusinessEntity].
extension BusinessEntityX on BusinessEntity {
  BusinessModel toModel() =>
      BusinessModel(name: name, location: location, contact: contact);
}
