import '../../domain/entities/details_entity.dart';
import '../../domain/repository/details_repository.dart';
import '../datasource/details_api_service.dart';
import '../mapper/details_mapper.dart';

//implementarea repo-ului real

class DetailsRepositoryImpl implements DetailsRepository {
  final DetailsApiService api;

  DetailsRepositoryImpl(this.api);

  @override
  Future<DetailsEntity> getDetails(int id) async {
    final dto = await api.getDetails(id);
    return DetailsMapper.fromDto(dto);
  }
}
