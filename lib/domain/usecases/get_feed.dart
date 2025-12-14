import '../repository/feed_repository.dart';
import '../entities/feed_entity.dart';

class GetFeed {
  final FeedRepository repo;

  GetFeed(this.repo);

  Future<FeedEntity> call() => repo.getFeed();
}
