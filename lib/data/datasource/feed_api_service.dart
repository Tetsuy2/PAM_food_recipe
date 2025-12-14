import 'package:dio/dio.dart';
import '../../core/network/dio_client.dart';

class FeedApiService {
  final Dio _dio = DioClient.instance;

  Future<Map<String, dynamic>> getFeed() async {
    final r = await _dio.get('feed');
    return r.data as Map<String, dynamic>;
  }
}
