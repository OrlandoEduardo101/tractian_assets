import 'package:auto_injector/auto_injector.dart';
import 'package:tractian_assets/app/modules/home/data/repositories/home_repository.dart';
import 'package:tractian_assets/app/modules/home/interactor/repositories/i_home_repository.dart';
import 'package:tractian_assets/app/shared/services/http_client/i_http_client.dart';
import 'package:uno/uno.dart';

import 'modules/assets_module/data/repositories/assets_repository.dart';
import 'modules/assets_module/interactor/repositories/i_assets_repository.dart';
import 'shared/services/http_client/uno_http_client.dart';
import 'shared/services/local_storage/shared_preferences_service.dart';
import 'shared/services/theme/theme_app_store.dart';

final injector = AutoInjector(on: (i) {
  // services
  i.addSingleton<Uno>(Uno.new);
  i.addSingleton<IHttpClient>(UnoHttpClient.new);
  i.addSingleton<SharedPreferencesService>(SharedPreferencesService.new);

  // repositories
  i.add<IHomeRepository>(HomeRepository.new);
  i.add<IAssetsRepository>(AssetsRepository.new);

  // stores
  i.addSingleton<ThemeAppStore>(ThemeAppStore.new);
});
