import 'package:flutter/material.dart';

class AppStore {
  final themeMode = ValueNotifier(ThemeMode.system);
  //Init var par<> of DateTime nullabase with initial value equals to null
  final syncDate = ValueNotifier<DateTime?>(null);

  AppStore();
  void initLocalStore() {}

  void saveLocalStore() {
    // TODO: Save current theme state  in local storage.
  }

  void changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      themeMode.value = mode;
      saveLocalStore();
    }
  }

  void setSyncDate(DateTime date) {
    syncDate.value = date;
    saveLocalStore();
  }
}
