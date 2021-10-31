import 'package:settings_ui/settings_ui.dart';
import 'package:flutter/material.dart';

//This is the the Settings page for user config
class Settings extends StatefulWidget {
  //Stores({Key key}) : super(key: key);
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text("Settings")),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'General',
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language),
                onTap: () {},
              ),
              SettingsTile.switchTile(
                title: 'Use fingerprint',
                leading: Icon(Icons.fingerprint),
                switchValue: true,
                onToggle: (bool value) {},
              ),
            ],
          ),
          SettingsSection(
            title: "Personal",
            tiles: [
              SettingsTile(
                title: "Name",
                subtitle: "Afrij",
                leading: Icon(Icons.self_improvement_rounded),
                onTap: () {},
              ),
              SettingsTile(
                title: "Phone Number",
                subtitle: "0776373528",
                leading: Icon(Icons.phone),
                onTap: () {},
              ),
              SettingsTile(
                title: "Email",
                subtitle: "afrij@gmail.com",
                leading: Icon(Icons.mail),
                onTap: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
