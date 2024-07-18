import 'package:asp/asp.dart';
import 'package:tractian_assets/app/modules/assets_module/interactor/models/assets_model.dart';
import 'package:tractian_assets/app/modules/assets_module/interactor/models/location_model.dart';

import '../models/node_entity.dart';

final assetsListState = Atom<List<AssetsModel>>([]);
final locationsListState = Atom<List<LocationModel>>([]);
final nodesComputedListState = Atom<List<NodeEntity>>([]);
final nodesComputedListStateFiltered = Atom<List<NodeEntity>>([]);
final isLoadingState = Atom<bool>(false);
final errorMessage = Atom<String>('');
