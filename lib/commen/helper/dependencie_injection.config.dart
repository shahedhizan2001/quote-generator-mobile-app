// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../feature/quote/application/facade.dart' as _i6;
import '../../feature/quote/domain/repo/repo.dart' as _i4;
import '../../feature/quote/infrastructure/remote/remote.dart' as _i3;
import '../../feature/quote/infrastructure/repo/repo_impl.dart' as _i5;
import '../../feature/quote/presentation/state/quote_bloc.dart' as _i7;

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
    gh.factory<_i3.QuoteRemote>(() => _i3.QuoteRemote());
    gh.factory<_i4.IQuoteRepo>(
        () => _i5.QuoteRepoImpl(quoteRemote: gh<_i3.QuoteRemote>()));
    gh.factory<_i6.QuoteFacade>(
        () => _i6.QuoteFacade(repo: gh<_i4.IQuoteRepo>()));
    gh.factory<_i7.QuoteBloc>(() => _i7.QuoteBloc(gh<_i6.QuoteFacade>()));
    return this;
  }
}
