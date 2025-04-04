// lib/providers/crypto_provider.dart (updated with favorites handling)
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/crypto_model.dart';
import '../models/favorite_model.dart';
import '../services/api_service.dart';
import '../services/favorite_service.dart';

part 'crypto_provider.g.dart';

@riverpod
ApiService apiService(ApiServiceRef ref) {
  return ApiService();
}

@riverpod
FavoriteService favoriteService(FavoriteServiceRef ref) {
  return FavoriteService();
}

@riverpod
class CryptoList extends _$CryptoList {
  @override
  Future<List<CryptoModel>> build() async {
    final apiService = ref.watch(apiServiceProvider);
    return await apiService.getCryptoList();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final apiService = ref.read(apiServiceProvider);
      state = AsyncValue.data(await apiService.getCryptoList());
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

@riverpod
class Favorites extends _$Favorites {
  @override
  Future<List<String>> build() async {
    final favoriteService = ref.watch(favoriteServiceProvider);
    final favorites = await favoriteService.getFavorites();
    return favorites.map((fav) => fav.name).toList();
  }

  Future<void> addFavorite(CryptoModel crypto) async {
    final favoriteService = ref.read(favoriteServiceProvider);
    await favoriteService.addFavorite(
      crypto.name,
      crypto.symbol,
      crypto.currentPrice,
      crypto.marketCapRank.toString(),
      crypto.priceChangePercentage24h,
      crypto.imageUrl,
    );
    ref.invalidateSelf();
    ref.invalidate(favoritesDetailsProvider);
  }

  Future<void> removeFavorite(String id) async {
    final favoriteService = ref.read(favoriteServiceProvider);
    await favoriteService.removeFavorite(id);
    ref.invalidateSelf();
    ref.invalidate(favoritesDetailsProvider);
  }
}

@riverpod
Future<List<FavoriteModel>> favoritesDetails(FavoritesDetailsRef ref) async {
  final favoriteService = ref.watch(favoriteServiceProvider);
  return await favoriteService.getFavorites();
}

@riverpod
Future<bool> isFavorite(IsFavoriteRef ref, String cryptoName) async {
  final favorites = await ref.watch(favoritesProvider.future);
  return favorites.contains(cryptoName);
}

@riverpod
Future<String?> favoriteId(FavoriteIdRef ref, String cryptoName) async {
  final favorites = await ref.watch(favoritesDetailsProvider.future);
  final match = favorites.where((fav) => fav.name == cryptoName).toList();
  return match.isNotEmpty ? match.first.id : null;
}