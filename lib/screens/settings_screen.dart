import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zyptopulse/gen/assets.gen.dart';
import '../providers/auth_provider.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: theme.textTheme.titleMedium),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSettingsTile(
            context: context,
            icon: Assets.icons.language,
            title: 'Language',
            trailingText: 'English',
            onTap: () {
                
            },
          ),
          _buildSettingsTile(
            context: context,
            icon: Assets.icons.appearance,
            title: 'Appearance',
            trailingText: themeMode == ThemeMode.dark
                ? 'Dark Mode'
                : themeMode == ThemeMode.light
                    ? 'Light Mode'
                    : 'Use Device Settings',
            onTap: () {
              _showThemeBottomSheet(context, ref);
            },
          ),
          _buildSettingsTile(
            context: context,
            icon: Assets.icons.aboutUs,
            title: 'About Us',
            trailingText: 'v1.2.3',
            onTap: () {
              context.push('/aboutUs');
            },
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () async {
                await ref.read(authProvider.notifier).signOut();
                if (context.mounted) {
                  context.go('/login');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Sign Out'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile({
    required BuildContext context,
    required SvgGenImage icon,
    required String title,
    required String trailingText,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);

    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
        height: 35,
        width: 40,
        alignment: Alignment.center,
        decoration:
            BoxDecoration(color: theme.cardColor, shape: BoxShape.circle),
        child: icon.svg(
          height: 17,
          width: 17,
        ),
      ),
      title: Text(title, style: theme.textTheme.bodyMedium),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            trailingText,
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.arrow_forward,
            size: 16,
            color: Color(0xff777777),
          ),
        ],
      ),
      onTap: onTap,
    );
  }

  void _showThemeBottomSheet(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final themeNotifier = ref.read(themeNotifierProvider.notifier);
    final currentThemeMode = ref.read(themeNotifierProvider);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose Theme',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  RadioListTile<ThemeMode>(
                    title: const Text('System Theme'),
                    subtitle: const Text('Follow system theme settings'),
                    value: ThemeMode.system,
                    groupValue: currentThemeMode,
                    onChanged: (value) {
                      themeNotifier.setThemeMode(value!);
                      Navigator.pop(context);
                    },
                  ),
                  RadioListTile<ThemeMode>(
                    title: const Text('Light Theme'),
                    subtitle: const Text('Always use light theme'),
                    value: ThemeMode.light,
                    groupValue: currentThemeMode,
                    onChanged: (value) {
                      themeNotifier.setThemeMode(value!);
                      Navigator.pop(context);
                    },
                  ),
                  RadioListTile<ThemeMode>(
                    title: const Text('Dark Theme'),
                    subtitle: const Text('Always use dark theme'),
                    value: ThemeMode.dark,
                    groupValue: currentThemeMode,
                    onChanged: (value) {
                      themeNotifier.setThemeMode(value!);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
