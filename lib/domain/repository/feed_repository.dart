import '../entities/feed_entity.dart';

abstract class FeedRepository {
  Future<FeedEntity> getFeed();
}
