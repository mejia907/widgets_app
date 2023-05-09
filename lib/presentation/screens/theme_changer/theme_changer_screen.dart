import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';
  const ThemChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkmode = ref.watch(themeNotifierProvider).isDarkmode;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme changer'),
        actions: [
          IconButton(
            onPressed: () {
              // ref.watch(isDarkmodeProvider.notifier).update((state) => !state);
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
            icon: Icon(isDarkmode
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    // final int selectedColorTheme = ref.watch(selectedColorProvider);
    final int selectedColorTheme =
        ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final Color color = colors[index];
          return RadioListTile(
              title: Text('Este color', style: TextStyle(color: color)),
              subtitle: Text('${color.value}'),
              activeColor: color,
              value: index,
              groupValue: selectedColorTheme,
              onChanged: (value) {
                // ref.read(selectedColorProvider.notifier).update((state) => index);
                ref.read(themeNotifierProvider.notifier).selectedColor(index);
              });
        });
  }
}
