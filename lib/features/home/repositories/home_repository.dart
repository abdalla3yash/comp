import 'package:comp/core/base/base_repository.dart';
import 'package:comp/core/services/error/failure.dart';
import 'package:comp/core/services/network/api_client.dart';
import 'package:comp/core/services/network/endpoints.dart';
import 'package:comp/features/home/model/get_url_model.dart';
import 'package:dartz/dartz.dart';

class HomeRepository extends BaseRepository {
  final ApiClient _apiClient;

  HomeRepository(super.networkInfo, this._apiClient);

  Future<Either<Failure, GetUrlModel>> getUploadUrl({required Map<String, dynamic> parameters}) {
    return super.call<GetUrlModel>(
      httpRequest: () => _apiClient.get(url: EndPoints.postVideo, queryParameters: parameters),
      successReturn: (response) => GetUrlModel.fromJson(response),
    );
  }

  Future<Either<Failure, bool>> postVideo({required String formData,required GetUrlModel serverResponse}) {
    return super.call<bool>(
      httpRequest: () => _apiClient.post( url: '',requestBody: formData,baseUrl:serverResponse.uploadURL!,queryParameters: {"Key":serverResponse.key}),
      successReturn: (_) => true,
    );
  }
}
