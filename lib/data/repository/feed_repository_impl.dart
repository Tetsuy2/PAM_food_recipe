import '../../domain/entities/feed_entity.dart';
import '../../domain/repository/feed_repository.dart';
import '../datasource/feed_api_service.dart';
import '../dto/feed_dto.dart';
import '../mapper/feed_mapper.dart';

class FeedRepositoryImpl implements FeedRepository {
  final FeedApiService api;

  FeedRepositoryImpl(this.api);

  @override
  Future<FeedEntity> getFeed() async {
    final json = await api.getFeed();
    final dto = FeedDto.fromJson(json);
    return FeedMapper.fromDto(dto);
  }
}
