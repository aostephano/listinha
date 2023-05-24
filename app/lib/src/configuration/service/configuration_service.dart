import 'package:realm/realm.dart';

import '../../shared/services/realm/model/configuration_model.dart';

abstract class ConfigurationService {
  ConfigurationModel
      getConfiguration(); //Declaração de um método abstrato que tem como return o Obj ConfigModel

  void saveConfiguration(String themeModeName, DateTime? syncDate);

  void deleteAll();
}

class ConfigurationServiceImpl implements ConfigurationService {
  final Realm realm;
  ConfigurationServiceImpl(this.realm);

  @override
  ConfigurationModel getConfiguration() {
    return realm.all<ConfigurationModel>().first;
  }

  @override
  void saveConfiguration(String themeModeName, DateTime? syncDate) {
    final currentModel = getConfiguration();
    realm.write(
      () {
        currentModel.themeModeName = themeModeName;
        currentModel.syncDate = syncDate;
      },
    );
  }

  @override
  void deleteAll() {
    realm.deleteAll();
  }
}
