import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/crypto_model.dart';
import '../models/favorite_model.dart';
import '../providers/crypto_provider.dart';

class CryptoFavoritesCard extends ConsumerWidget {
  final FavoriteModel favorite;

  const CryptoFavoritesCard({
    super.key,
    required this.favorite,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final bool isPositive = favorite.priceChangePercentage24h >= 0;
    final String priceChange =
        favorite.priceChangePercentage24h.toStringAsFixed(2);

      
    final String formattedDate =
        "2021-08-02 04:39:26";   

    return Container(
      margin: const EdgeInsets.only(bottom: 1),
      child: Column(
        children: [
          Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              extentRatio: 0.25,
              children: [
                CustomSlidableAction(
                  onPressed: (context) async {
                      
                    final shouldDelete = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Remove from favorites?'),
                            content: Text(
                                'Do you want to remove ${favorite.name} from your favorites?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: Text(
                                  'Remove',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ) ??
                        false;

                    if (shouldDelete) {
                      await ref
                          .read(favoritesProvider.notifier)
                          .removeFavorite(favorite.id);
                      ref.invalidate(favoritesDetailsProvider);

                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('${favorite.name} removed from favorites'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () async {
                                final cryptoList =
                                    await ref.read(cryptoListProvider.future);
                                final cryptoToAdd = cryptoList.firstWhere(
                                  (c) => c.name == favorite.name,
                                  orElse: () => CryptoModel(
                                    id: favorite.name.toLowerCase(),
                                    symbol: favorite.symbol,
                                    name: favorite.name,
                                    currentPrice: favorite.currentPrice,
                                    imageUrl: favorite.imageUrl,
                                    marketCapRank:
                                        int.parse(favorite.marketCapRank),
                                    priceChangePercentage24h:
                                        favorite.priceChangePercentage24h,
                                  ),
                                );
                                await ref
                                    .read(favoritesProvider.notifier)
                                    .addFavorite(cryptoToAdd);
                              },
                            ),
                          ),
                        );
                      }
                    }
                  },
                  backgroundColor: theme.scaffoldBackgroundColor,
                  foregroundColor: Colors.red,
                  child: const Icon(Icons.delete_outline),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                      
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        favorite.imageUrl,
                        width: 40,
                        height: 40,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                favorite.symbol.substring(0, 1).toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 12),

                      
                    Text(
                      favorite.symbol.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Spacer(),

                      
                    Text(formattedDate, style: theme.textTheme.bodySmall),

                    const SizedBox(width: 8),

                      
                    const Icon(
                      Icons.chevron_right,
                      color: Color(0xFF8A8D93),
                      size: 20,
                    ),
                  ],
                ),

                  
                Row(
                  children: [
                    const SizedBox(width: 52),
                    Text("Market Cap Rank", style: theme.textTheme.bodySmall),
                    const Spacer(),
                    Text(favorite.marketCapRank,
                        style: theme.textTheme.labelLarge
                            ?.copyWith(color: theme.primaryColor)),
                  ],
                ),

                  
                Row(
                  children: [
                    const SizedBox(width: 52),
                    Text("Price", style: theme.textTheme.bodySmall),
                    const Spacer(),
                    Text(
                      favorite.currentPrice.toStringAsFixed(2),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                  
                Row(
                  children: [
                    const SizedBox(width: 52),
                    Text("Price Change Percentage 24h",
                        style: theme.textTheme.bodySmall),
                    const Spacer(),
                    Text(
                      "${isPositive ? '+' : ''}$priceChange%",
                      style: TextStyle(
                        color: isPositive
                            ? const Color(0xFF00E8C6)
                            : const Color(0xFFFF5252),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: Divider(
                endIndent: 8,
                indent: 8,
                height: 2,
                thickness: 0.6,
                color: Colors.grey.shade800,
              ),
            ),
          )
        ],
      ),
    );
  }
}
