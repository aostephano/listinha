import 'package:realm/realm.dart'; // import realm package
part 'configuration_model.g.dart'; // declare a part file. Database will be generated here

@RealmModel()
class _ConfigurationModel {
  late String themeModeName;
  late DateTime? syncDate;
}
