import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../shared/stores/app_store.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    final appStore = context.watch<AppStore>(
      (store) => store.themeMode,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          right: 16,
          left: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Tema',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            RadioListTile<ThemeMode>(
              title: Text(
                'Sistema',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              value: ThemeMode.system,
              groupValue: appStore.themeMode.value,
              onChanged: appStore.changeThemeMode,
            ),
            RadioListTile<ThemeMode>(
              title: Text(
                'Claro',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              value: ThemeMode.light,
              groupValue: appStore.themeMode.value,
              onChanged: appStore.changeThemeMode,
            ),
            RadioListTile<ThemeMode>(
              title: Text(
                'Escuro',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              value: ThemeMode.dark,
              groupValue: appStore.themeMode.value,
              onChanged: appStore.changeThemeMode,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Controle de dados'),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              child: Text(
                'Apagar cache e reiniciar o app',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
