import 'package:flutter/material.dart';

class UIControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UIControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UI Controls'),
        ),
        body: const _UIControlsView());
  }
}

enum Transportation { car, plane, boat, submarine }

class _UIControlsView extends StatefulWidget {
  const _UIControlsView(
      // {super.key,}
      );

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloper = true;
  Transportation selectedTranport = Transportation.boat;
  bool wantsBreakfast = false;
  bool wantsLaunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            value: isDeveloper,
            title: const Text('Developer Mode'),
            subtitle: const Text('Controles adicionales'),
            onChanged: (value) {
              isDeveloper = !isDeveloper;
              setState(() {});
            }),
        ExpansionTile(
          title: const Text('Selected Transport'),
          subtitle: Text(selectedTranport.name),
          children: [
            RadioListTile(
              value: Transportation.car,
              title: const Text('Car'),
              subtitle: const Text('Transport on car'),
              groupValue: selectedTranport,
              onChanged: (value) {
                setState(() {
                  selectedTranport = Transportation.car;
                });
              },
            ),
            RadioListTile(
              value: Transportation.plane,
              title: const Text('Plane'),
              subtitle: const Text('Transport on Plane'),
              groupValue: selectedTranport,
              onChanged: (value) {
                setState(() {
                  selectedTranport = Transportation.plane;
                });
              },
            ),
            RadioListTile(
              value: Transportation.boat,
              title: const Text('Boat'),
              subtitle: const Text('Transport on Boat'),
              groupValue: selectedTranport,
              onChanged: (value) {
                setState(() {
                  selectedTranport = Transportation.boat;
                });
              },
            ),
            RadioListTile(
              value: Transportation.submarine,
              title: const Text('Submarine'),
              subtitle: const Text('Transport on Submarine'),
              groupValue: selectedTranport,
              onChanged: (value) {
                setState(() {
                  selectedTranport = Transportation.submarine;
                });
              },
            ),
          ],
        ),
        
        CheckboxListTile(
          title: const Text('Breakfast?'),
          value: wantsBreakfast, 
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('Launch?'),
          value: wantsLaunch, 
          onChanged: (value) => setState(() {
            wantsLaunch = !wantsLaunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('Dinner?'),
          value: wantsDinner, 
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      
      ],
    );
  }
}
