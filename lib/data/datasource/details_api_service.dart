import 'package:dio/dio.dart';
import '../../core/network/dio_client.dart';
import '../dto/details_dto.dart';

class DetailsApiService {
  final Dio _dio = DioClient.instance;

  Future<DetailsDto> getDetails(int id) async {
    final r = await _dio.get(
      'feed/details',
      queryParameters: {'id': id},
    );

    return DetailsDto.fromJson(r.data as Map<String, dynamic>);
  }
}
