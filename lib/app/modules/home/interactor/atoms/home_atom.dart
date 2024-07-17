import 'package:asp/asp.dart';
import 'package:tractian_assets/app/modules/home/interactor/models/company_model.dart';

final companiesListState = Atom<List<CompanyModel>>([]);
final isLoadingState = Atom<bool>(false);
final errorMessage = Atom<String>('');
