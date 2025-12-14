import '../entities/details_entity.dart';

abstract class DetailsRepository {
  Future<DetailsEntity> getDetails(int id);
}
