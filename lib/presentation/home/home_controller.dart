import 'package:flutter/foundation.dart';
import '../../domain/entities/feed_entity.dart';
import '../../domain/usecases/get_feed.dart';

class HomeController extends ChangeNotifier {
  final GetFeed getFeedUseCase;

  HomeController(this.getFeedUseCase);

  bool loading = false;
  FeedEntity? data;
  String? error;

  Future<void> load() async {
    loading = true;
    error = null;
    notifyListeners();

    try {
      data = await getFeedUseCase();
    } catch (e, st) {
      error = e.toString();
      debugPrint('HomeController.load ERROR: $e');
      debugPrint('$st');
      data = null;
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
