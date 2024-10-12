import 'package:flutter/material.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:installed_apps/app_info.dart';
import '../../utils/data.dart';
import '../../utils/loader.dart';

class AppSelectionPage extends StatefulWidget {
  const AppSelectionPage({super.key});

  @override
  _AppSelectionPageState createState() => _AppSelectionPageState();
}

class _AppSelectionPageState extends State<AppSelectionPage> {
  final Loader _loader = Loader();

  @override
  void initState() {
    super.initState();
    _loader.loadSelectedApps().then((_) {
      setState(() {}); // Refresh the UI after loading selected apps
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mentor/Apps/Selection',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: Data.apps.length,
              itemBuilder: (context, index) {
                final AppInfo app = Data.apps[index];
                return Column(
                  children: [
                    CheckboxListTile(
                      title: Text(
                        app.name, // Use 'name' instead of 'appName'
                      ),
                      value: Data.selected_apps.contains(app),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value != null && value) {
                            Data.selected_apps.add(app);
                          } else {
                            Data.selected_apps.remove(app);
                          }
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: const Icon(Icons.check),
        onPressed: () async {
          await _loader.saveSelectedApps();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
