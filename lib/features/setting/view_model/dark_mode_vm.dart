import 'package:flutter/material.dart';
import 'package:thread_clone/features/setting/models/dark_mode_model.dart';
import 'package:thread_clone/features/setting/repos/dark_mode_repo.dart';

class DarkModeVm extends ChangeNotifier with WidgetsBindingObserver {
  final DarkModeRepo _repo;

  DarkModeVm(this._repo) {
    _model = DarkModeModel(isDarkMode: _repo.isDarkMode());
    WidgetsBinding.instance.addObserver(this);
  }

  late final DarkModeModel _model;

  bool get darked => _model.isDarkMode;

  void setDarked(bool value) {
    _repo.setDarked(value);
    _model.isDarkMode = value;
    notifyListeners();
  }

  @override
  void didChangePlatformBrightness() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    final isSystemDarkMode = brightness == Brightness.dark;
    if (isSystemDarkMode != _model.isDarkMode) {
      setDarked(isSystemDarkMode);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
