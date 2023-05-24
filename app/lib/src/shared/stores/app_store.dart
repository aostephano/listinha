import 'package:flutter/material.dart';

import '../../configuration/service/configuration_service.dart';

class AppStore {
  final themeMode = ValueNotifier(ThemeMode.system);
  //Init var par<> of DateTime nullabase with initial value equals to null
  final syncDate = ValueNotifier<DateTime?>(null);
  final ConfigurationService _configurationService;

  //Chama o método init DENTRO do construtor
  AppStore(this._configurationService) {
    init();
  }

  //Inicializa o que é relativo ao realm
  void init() {
    final model = _configurationService.getConfiguration();
    themeMode.value = _getThemeModeByName(model.themeModeName);
  }

  void save() {
    _configurationService.saveConfiguration(
      themeMode.value.name,
      syncDate.value,
    );
  }

  void changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      themeMode.value = mode;
      save();
    }
  }

  void setSyncDate(DateTime date) {
    syncDate.value = date;
    save();
  }

  void deleteApp() {
    _configurationService.deleteAll();
  }

  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.values.firstWhere((mode) => mode.name == name);
  }
}
