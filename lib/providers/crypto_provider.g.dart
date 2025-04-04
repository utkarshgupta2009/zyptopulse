// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apiServiceHash() => r'ce72c4f572ea14a273b01086cdc8905a2e469468';

/// See also [apiService].
@ProviderFor(apiService)
final apiServiceProvider = AutoDisposeProvider<ApiService>.internal(
  apiService,
  name: r'apiServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$apiServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ApiServiceRef = AutoDisposeProviderRef<ApiService>;
String _$favoriteServiceHash() => r'c814597adcb2ff60aaafdb44921b7a619af12065';

/// See also [favoriteService].
@ProviderFor(favoriteService)
final favoriteServiceProvider = AutoDisposeProvider<FavoriteService>.internal(
  favoriteService,
  name: r'favoriteServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FavoriteServiceRef = AutoDisposeProviderRef<FavoriteService>;
String _$favoritesDetailsHash() => r'e861fbcd4df162b206ab6bf5df2e1a98382be7bb';

/// See also [favoritesDetails].
@ProviderFor(favoritesDetails)
final favoritesDetailsProvider =
    AutoDisposeFutureProvider<List<FavoriteModel>>.internal(
  favoritesDetails,
  name: r'favoritesDetailsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoritesDetailsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FavoritesDetailsRef = AutoDisposeFutureProviderRef<List<FavoriteModel>>;
String _$isFavoriteHash() => r'4ed61395a0922e4a7fa6a509ca2699e95c44028e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [isFavorite].
@ProviderFor(isFavorite)
const isFavoriteProvider = IsFavoriteFamily();

/// See also [isFavorite].
class IsFavoriteFamily extends Family<AsyncValue<bool>> {
  /// See also [isFavorite].
  const IsFavoriteFamily();

  /// See also [isFavorite].
  IsFavoriteProvider call(
    String cryptoName,
  ) {
    return IsFavoriteProvider(
      cryptoName,
    );
  }

  @override
  IsFavoriteProvider getProviderOverride(
    covariant IsFavoriteProvider provider,
  ) {
    return call(
      provider.cryptoName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'isFavoriteProvider';
}

/// See also [isFavorite].
class IsFavoriteProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [isFavorite].
  IsFavoriteProvider(
    String cryptoName,
  ) : this._internal(
          (ref) => isFavorite(
            ref as IsFavoriteRef,
            cryptoName,
          ),
          from: isFavoriteProvider,
          name: r'isFavoriteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isFavoriteHash,
          dependencies: IsFavoriteFamily._dependencies,
          allTransitiveDependencies:
              IsFavoriteFamily._allTransitiveDependencies,
          cryptoName: cryptoName,
        );

  IsFavoriteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.cryptoName,
  }) : super.internal();

  final String cryptoName;

  @override
  Override overrideWith(
    FutureOr<bool> Function(IsFavoriteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsFavoriteProvider._internal(
        (ref) => create(ref as IsFavoriteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        cryptoName: cryptoName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _IsFavoriteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsFavoriteProvider && other.cryptoName == cryptoName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cryptoName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IsFavoriteRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `cryptoName` of this provider.
  String get cryptoName;
}

class _IsFavoriteProviderElement extends AutoDisposeFutureProviderElement<bool>
    with IsFavoriteRef {
  _IsFavoriteProviderElement(super.provider);

  @override
  String get cryptoName => (origin as IsFavoriteProvider).cryptoName;
}

String _$favoriteIdHash() => r'17700062c1010ceff263fdf86d16035d0dd773f4';

/// See also [favoriteId].
@ProviderFor(favoriteId)
const favoriteIdProvider = FavoriteIdFamily();

/// See also [favoriteId].
class FavoriteIdFamily extends Family<AsyncValue<String?>> {
  /// See also [favoriteId].
  const FavoriteIdFamily();

  /// See also [favoriteId].
  FavoriteIdProvider call(
    String cryptoName,
  ) {
    return FavoriteIdProvider(
      cryptoName,
    );
  }

  @override
  FavoriteIdProvider getProviderOverride(
    covariant FavoriteIdProvider provider,
  ) {
    return call(
      provider.cryptoName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'favoriteIdProvider';
}

/// See also [favoriteId].
class FavoriteIdProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [favoriteId].
  FavoriteIdProvider(
    String cryptoName,
  ) : this._internal(
          (ref) => favoriteId(
            ref as FavoriteIdRef,
            cryptoName,
          ),
          from: favoriteIdProvider,
          name: r'favoriteIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$favoriteIdHash,
          dependencies: FavoriteIdFamily._dependencies,
          allTransitiveDependencies:
              FavoriteIdFamily._allTransitiveDependencies,
          cryptoName: cryptoName,
        );

  FavoriteIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.cryptoName,
  }) : super.internal();

  final String cryptoName;

  @override
  Override overrideWith(
    FutureOr<String?> Function(FavoriteIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FavoriteIdProvider._internal(
        (ref) => create(ref as FavoriteIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        cryptoName: cryptoName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _FavoriteIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FavoriteIdProvider && other.cryptoName == cryptoName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cryptoName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FavoriteIdRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `cryptoName` of this provider.
  String get cryptoName;
}

class _FavoriteIdProviderElement
    extends AutoDisposeFutureProviderElement<String?> with FavoriteIdRef {
  _FavoriteIdProviderElement(super.provider);

  @override
  String get cryptoName => (origin as FavoriteIdProvider).cryptoName;
}

String _$cryptoListHash() => r'fde22ffd4ec959c82d54ec08e982463713295b9e';

/// See also [CryptoList].
@ProviderFor(CryptoList)
final cryptoListProvider =
    AutoDisposeAsyncNotifierProvider<CryptoList, List<CryptoModel>>.internal(
  CryptoList.new,
  name: r'cryptoListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cryptoListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CryptoList = AutoDisposeAsyncNotifier<List<CryptoModel>>;
String _$favoritesHash() => r'47b192c398c9a4731fffa615a7e255eef7f21091';

/// See also [Favorites].
@ProviderFor(Favorites)
final favoritesProvider =
    AutoDisposeAsyncNotifierProvider<Favorites, List<String>>.internal(
  Favorites.new,
  name: r'favoritesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$favoritesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Favorites = AutoDisposeAsyncNotifier<List<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
