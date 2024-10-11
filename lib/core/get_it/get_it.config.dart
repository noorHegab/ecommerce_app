// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/cart/data/data_source/data_sorce_imp.dart' as _i9;
import '../../features/cart/data/data_source/data_source.dart' as _i8;
import '../../features/cart/data/repo/repo.dart' as _i11;
import '../../features/cart/domain/repo/repo.dart' as _i10;
import '../../features/cart/domain/use_cse/get_cart_use_case.dart' as _i14;
import '../../features/cart/presntaion/manager/cubit.dart' as _i20;
import '../../features/main_layout/data/data_source/data_source.dart' as _i6;
import '../../features/main_layout/data/data_source/data_source_imp.dart'
    as _i7;
import '../../features/main_layout/data/repo/repo_imp.dart' as _i16;
import '../../features/main_layout/domain/repo/repo.dart' as _i15;
import '../../features/main_layout/domain/use_cases/get_all_brands_use_case.dart'
    as _i17;
import '../../features/main_layout/domain/use_cases/get_categories_use_case.dart'
    as _i18;
import '../../features/main_layout/domain/use_cases/get_wash_lsit_use_case.dart'
    as _i19;
import '../../features/main_layout/manager/cubit.dart' as _i24;
import '../../features/products_screen/data/data_source/data_source.dart'
    as _i4;
import '../../features/products_screen/data/data_source/data_source_imp.dart'
    as _i5;
import '../../features/products_screen/data/repo/repo_imp.dart' as _i13;
import '../../features/products_screen/domain/repo/repo.dart' as _i12;
import '../../features/products_screen/domain/use_case/add_cart_use_case.dart'
    as _i21;
import '../../features/products_screen/domain/use_case/add_washlist_use_case.dart'
    as _i22;
import '../../features/products_screen/domain/use_case/get_product_use_case.dart'
    as _i23;
import '../../features/products_screen/presentation/manager/cubit.dart' as _i25;
import '../services/network_service.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.Network>(() => _i3.Network());
    gh.factory<_i4.ProductDataSource>(
        () => _i5.ProductDataSourceImp(gh<_i3.Network>()));
    gh.factory<_i6.MainDataSource>(
        () => _i7.MainDataSourceImp(gh<_i3.Network>()));
    gh.factory<_i8.CartDataSource>(
        () => _i9.CartDataSourceImp(gh<_i3.Network>()));
    gh.factory<_i10.CartRepo>(() => _i11.CartRepoImp(gh<_i8.CartDataSource>()));
    gh.factory<_i12.ProductRepo>(
        () => _i13.ProductRepoImp(gh<_i4.ProductDataSource>()));
    gh.factory<_i14.GetCartUseCase>(
        () => _i14.GetCartUseCase(gh<_i10.CartRepo>()));
    gh.factory<_i15.MainRepo>(() => _i16.MainRepoImp(gh<_i6.MainDataSource>()));
    gh.factory<_i17.GetBrandsUseCase>(
        () => _i17.GetBrandsUseCase(gh<_i15.MainRepo>()));
    gh.factory<_i18.GetCategoriesUseCase>(
        () => _i18.GetCategoriesUseCase(gh<_i15.MainRepo>()));
    gh.factory<_i19.GetWashListUseCase>(
        () => _i19.GetWashListUseCase(gh<_i15.MainRepo>()));
    gh.factory<_i20.CartCubit>(() => _i20.CartCubit(gh<_i14.GetCartUseCase>()));
    gh.factory<_i21.AddCartUseCase>(
        () => _i21.AddCartUseCase(gh<_i12.ProductRepo>()));
    gh.factory<_i22.AddWashListUseCase>(
        () => _i22.AddWashListUseCase(gh<_i12.ProductRepo>()));
    gh.factory<_i23.GetProductUseCase>(
        () => _i23.GetProductUseCase(gh<_i12.ProductRepo>()));
    gh.factory<_i24.MainCubit>(() => _i24.MainCubit(
          gh<_i18.GetCategoriesUseCase>(),
          gh<_i17.GetBrandsUseCase>(),
          gh<_i19.GetWashListUseCase>(),
        ));
    gh.factory<_i25.ProductCubit>(() => _i25.ProductCubit(
          gh<_i23.GetProductUseCase>(),
          gh<_i22.AddWashListUseCase>(),
          gh<_i21.AddCartUseCase>(),
        ));
    return this;
  }
}
