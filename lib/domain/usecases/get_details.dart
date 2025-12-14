import '../entities/details_entity.dart';
import '../repository/details_repository.dart';

class GetDetails {
  final DetailsRepository repo;

  GetDetails(this.repo);

  Future<DetailsEntity> call(int id) => repo.getDetails(id);
}
