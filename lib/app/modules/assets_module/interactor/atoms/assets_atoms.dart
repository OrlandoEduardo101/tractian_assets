import 'package:asp/asp.dart';
import 'package:tractian_assets/app/modules/assets_module/interactor/models/assets_model.dart';
import 'package:tractian_assets/app/modules/assets_module/interactor/models/location_model.dart';

final assetsListState = Atom<List<AssetsModel>>([]);
final locationsListState = Atom<List<LocationModel>>([]);
final isLoadingState = Atom<bool>(false);
final errorMessage = Atom<String>('');
