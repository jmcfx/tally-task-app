import 'package:tally_task/features/business/data/client/business_client.dart';
import 'package:tally_task/features/business/data/models/business_model.dart';

abstract interface class BusinessRemoteDataSource {
  /// Fetches a list of businesses.
  Future<List<BusinessModel>> getBusinesses();
}

/// Concrete implementation of [BusinessRemoteDataSource] that uses a [BusinessClient].
class BusinessRemoteDataSourceImpl implements BusinessRemoteDataSource {
  /// The client responsible for making the actual network requests.
  final BusinessClient _client;

  BusinessRemoteDataSourceImpl({required BusinessClient client})
    : _client = client;

  @override
  Future<List<BusinessModel>> getBusinesses() {
    return _client.getBusinesses();
  }
}
