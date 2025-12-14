import 'package:flutter/foundation.dart';
import '../../domain/entities/details_entity.dart';
import '../../domain/usecases/get_details.dart';

class DetailsController extends ChangeNotifier {
  final GetDetails getDetailsUseCase;

  DetailsController(this.getDetailsUseCase);

  bool loading = false;
  DetailsEntity? data;
  String? error;

  Future<void> load(int id) async {
    loading = true;
    error = null;
    notifyListeners();

    try {
      data = await getDetailsUseCase(id);
    } catch (e, st) {
      error = e.toString();
      debugPrint('DetailsController.load ERROR: $e');
      debugPrint('$st');
      data = null;
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
