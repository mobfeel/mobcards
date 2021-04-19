import 'package:flutter/material.dart';
import 'package:mobboards/translate/translate.dart';
import 'package:mobboards/component/component.dart';
import 'package:mobboards/views/views.dart';
import 'package:mobboards/utilities/utilities.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextToSpeech textToSpeech = new TextToSpeech();

  _volumeSliderRow() {
    return Slider(
      onChanged: (newVolume) {
        setState(
          () {
            TextToSpeech.volume = newVolume;
          },
        );
      },
      value: TextToSpeech.volume,
      min: 0.0,
      max: 1.0,
      divisions: 10,
      activeColor: Colors.green,
    );
  }

  _pitchSliderRow() {
    return Slider(
      value: TextToSpeech.pitch,
      min: 0,
      max: 1.0,
      divisions: 10,
      label: 'Pitch: ${TextToSpeech.pitch}',
      onChanged: (newPitch) {
        setState(() {
          TextToSpeech.pitch = newPitch;
        });
      },
      activeColor: Colors.red,
    );
  }

  _rateSliderRow() {
    return Slider(
      value: TextToSpeech.rate,
      onChanged: (newRate) {
        setState(() {
          TextToSpeech.rate = newRate;
        });
      },
      min: 0.0,
      max: 1.0,
      divisions: 10,
      label: "Rate: ${TextToSpeech.rate}",
      activeColor: Colors.blue,
    );
  }

  _testConfigRow() {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
      ),
      child: Text(
        AppLocalizations.of(context).translate('settings_page_test_sound'),
      ),
      onPressed: () {
        setState(
          () {
            textToSpeech.speechMessage = AppLocalizations.of(context)
                .translate('settings_page_test_sound_message');
            textToSpeech.speak();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('screen_settings'),
        ),
        backgroundColor: CustomColors.primaryMobfeel,
      ),
      drawer: DrawerComponent(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context).translate("settings_page_volume"),
              ),
              _volumeSliderRow(),
              Text(
                AppLocalizations.of(context).translate("settings_page_pitch"),
              ),
              _pitchSliderRow(),
              Text(
                AppLocalizations.of(context).translate("settings_page_rate"),
              ),
              _rateSliderRow(),
              _testConfigRow()
            ],
          ),
        ),
      ),
    );
  }
}
