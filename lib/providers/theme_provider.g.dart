// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$themeHash() => r'1c3ac019a45b0bf58c34ebf6af1e41fef10d5107';

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

/// See also [theme].
@ProviderFor(theme)
const themeProvider = ThemeFamily();

/// See also [theme].
class ThemeFamily extends Family<ThemeData> {
  /// See also [theme].
  const ThemeFamily();

  /// See also [theme].
  ThemeProvider call(
    BuildContext context,
  ) {
    return ThemeProvider(
      context,
    );
  }

  @override
  ThemeProvider getProviderOverride(
    covariant ThemeProvider provider,
  ) {
    return call(
      provider.context,
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
  String? get name => r'themeProvider';
}

/// See also [theme].
class ThemeProvider extends AutoDisposeProvider<ThemeData> {
  /// See also [theme].
  ThemeProvider(
    BuildContext context,
  ) : this._internal(
          (ref) => theme(
            ref as ThemeRef,
            context,
          ),
          from: themeProvider,
          name: r'themeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$themeHash,
          dependencies: ThemeFamily._dependencies,
          allTransitiveDependencies: ThemeFamily._allTransitiveDependencies,
          context: context,
        );

  ThemeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
  }) : super.internal();

  final BuildContext context;

  @override
  Override overrideWith(
    ThemeData Function(ThemeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ThemeProvider._internal(
        (ref) => create(ref as ThemeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<ThemeData> createElement() {
    return _ThemeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ThemeProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ThemeRef on AutoDisposeProviderRef<ThemeData> {
  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _ThemeProviderElement extends AutoDisposeProviderElement<ThemeData>
    with ThemeRef {
  _ThemeProviderElement(super.provider);

  @override
  BuildContext get context => (origin as ThemeProvider).context;
}

String _$themeNotifierHash() => r'e95676c93660c3ba83c7b44f613ff9f0dde3225a';

/// See also [ThemeNotifier].
@ProviderFor(ThemeNotifier)
final themeNotifierProvider =
    AutoDisposeNotifierProvider<ThemeNotifier, ThemeMode>.internal(
  ThemeNotifier.new,
  name: r'themeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$themeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ThemeNotifier = AutoDisposeNotifier<ThemeMode>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
