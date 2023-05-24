import 'package:listinha/src/shared/services/realm/model/configuration_model.dart';
import 'package:realm/realm.dart';

LocalConfiguration config = Configuration.local(
  [
    ConfigurationModel.schema,
  ],
  initialDataCallback: (realm) {
    realm.add(ConfigurationModel('system'));
  },
  path: './realm/realm.db',
);
