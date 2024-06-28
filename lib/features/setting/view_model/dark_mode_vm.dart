import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/features/setting/models/dark_mode_model.dart';
import 'package:thread_clone/features/setting/repos/dark_mode_repo.dart';

class DarkModeVm extends Notifier<DarkModeModel> with WidgetsBindingObserver {
  final DarkModeRepo _repo;

  DarkModeVm(this._repo) {
    WidgetsBinding.instance.addObserver(this);
  }

  void setDarkMode(bool value) {
    _repo.setDarked(value);
    state = DarkModeModel(
      isDarkMode: value,
    );
  }

  @override
  void didChangePlatformBrightness() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    final isSystemDarkMode = brightness == Brightness.dark;
    if (isSystemDarkMode != state.isDarkMode) {
      setDarkMode(isSystemDarkMode);
    }
  }

  @override
  DarkModeModel build() {
    return DarkModeModel(
      isDarkMode: _repo.isDarkMode(),
    );
  }
}

final darkModeProvider = NotifierProvider<DarkModeVm, DarkModeModel>(
  () => throw UnimplementedError(),
);
