import 'package:flutter/material.dart';
import 'package:listinha/src/home/widgets/custom_drawer.dart';
import '../shared/widgets/user_image_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('LISTINHA'),
        actions: const [
          Padding(padding: EdgeInsets.only(right: 8),
            child: UserImageButton(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed('./edit');
        },
        label: const Text('Nova Lista'),
        icon: const Icon(Icons.edit),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: SegmentedButton<int>(
                segments: const [
                  ButtonSegment(value: 0, label: Text('Todos'),),
                  ButtonSegment(value: 1, label: Text('Pendentes'),),
                  ButtonSegment(value: 2, label: Text('Concluídas'),),
                  ButtonSegment(value: 3, label: Text('Desativadas'),),
                ],
                selected: const {1},
                onSelectionChanged: (values) {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
