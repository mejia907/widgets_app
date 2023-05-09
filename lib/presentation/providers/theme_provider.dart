import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkmodeProvider = StateProvider<bool>((ref) => false);

/// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);
final selectedColorProvider = StateProvider((ref) => 0);

///Un objeto de tipo AppTheme
final themeNotifierProvider =
    StateNotifierProvider<ControllerThemeNotifier, AppTheme>(
  (ref) => ControllerThemeNotifier(),
);

class ControllerThemeNotifier extends StateNotifier<AppTheme> {
  ///State = Estado = new AppTheme()
  ControllerThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkmode: !state.isDarkmode);
  }

  void selectedColor(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
