// Map view for both map page and detail page

import 'package:flutter/material.dart';
import 'package:moovup_program_test/Models/PeopleAPIModel.dart';
import 'package:moovup_program_test/Views/MapView/MapViewModel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';
import 'package:moovup_program_test/Models/PeopleListModel.dart';

import '../../Common/Widgets/MapViewPopup.dart';
import '../../Common/Widgets/PersonMarker.dart';

class MapView extends StatefulWidget {
  final MapViewModel mapViewModel;
  PersonModel? person;

  MapView({super.key, this.person, required this.mapViewModel});

  @override
  State<StatefulWidget> createState() {
    return _MapViewState();
  }
}

class _MapViewState extends State<MapView> with AutomaticKeepAliveClientMixin {
  late final MapViewModel vm;
  late final PopupController _popupController;

  @override
  void initState() {
    super.initState();
    vm = widget.mapViewModel;
    _popupController = PopupController();
  }

  List<PersonMarker> _buildMarkers() { //Function to build all markers
    return vm.people
        .map((person) => PersonMarker(
              person: person,
              point: LatLng(person.location?.latitude ?? 0,
                  person.location?.longitude ?? 0),
              child: const Icon(
                Icons.pin_drop,
                color: Colors.red,
                size: 40,
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PeopleListModel>(builder: (context, person, child) { // When PeopleListModel updated, the widget will reload
        vm.people = widget.person != null // Check for data from detail page or map page
            ? [widget.person!]
            : Provider.of<PeopleListModel>(context, listen: false).people;
        return FlutterMap(
          options: MapOptions(
              maxZoom: 17.0,
              minZoom: 2.0,
              initialZoom: 10.0,
              initialCenter: vm.getInitialCenter(),
              interactionOptions: const InteractionOptions(
                  flags: InteractiveFlag.pinchZoom | InteractiveFlag.drag)),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            ),
            PopupMarkerLayer(
              options: PopupMarkerLayerOptions(
                markerCenterAnimation: const MarkerCenterAnimation(),
                markers: _buildMarkers(),
                popupController: _popupController,
                popupDisplayOptions: PopupDisplayOptions(
                    builder: (BuildContext context, Marker marker) {
                  if (marker is PersonMarker) {
                    return MapViewPopup(marker);
                  } else {
                    return const Card(
                      child: Text('Not a user'),
                    );
                  }
                }),
              ),
            ),
          ],
        );
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
