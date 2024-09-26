//Popup on map when user click marker

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'PersonMarker.dart';

class MapViewPopup extends StatefulWidget {
  final PersonMarker marker;

  const MapViewPopup(this.marker, {super.key});

  @override
  State<StatefulWidget> createState() => _MapViewPopupState();
}

class _MapViewPopupState extends State<MapViewPopup> {
  final List<IconData> _icons = [
    Icons.star_border,
    Icons.star_half,
    Icons.star
  ];
  int _currentIcon = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => setState(() {
          _currentIcon = (_currentIcon + 1) % _icons.length;
        }),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 0),
              child: CircleAvatar(
                radius: 25,
                foregroundImage:
                    NetworkImage(widget.marker.person?.picture ?? ""),
              ),
            ),
            _cardDescription(context),
          ],
        ),
      ),
    );
  }

  Widget _cardDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        constraints: const BoxConstraints(minWidth: 100, maxWidth: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "${widget.marker.person?.name?.first ?? ""} ${widget.marker.person?.name?.last ?? ""}",
              overflow: TextOverflow.fade,
              softWrap: false,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
            Text(
              'Position: ${widget.marker.point.latitude}, ${widget.marker.point.longitude}',
              style: const TextStyle(fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}
