import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:tally_task/features/business/data/models/business_model.dart';

part 'business_client.g.dart';

@RestApi(baseUrl: "https://local.api")
abstract interface class BusinessClient {
  factory BusinessClient(Dio dio, {String baseUrl}) = _BusinessClient;

  @GET("/businesses")
  Future<List<BusinessModel>> getBusinesses();
}
