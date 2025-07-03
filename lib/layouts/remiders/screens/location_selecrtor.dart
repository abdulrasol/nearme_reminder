import 'package:flutter/material.dart';
import 'package:osm_search_and_pick/open_street_map_search_and_pick.dart';

class LocationSelecrtor extends StatelessWidget {
  const LocationSelecrtor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: OpenStreetMapSearchAndPick(
          //center: LatLong(23, 89),
          buttonColor: Colors.blue,
          buttonText: 'Set Current Location',
          onPicked: (pickedData) {
            Navigator.pop(
              context,
              {
                'place': pickedData.address['amenity'] ?? '',
                'road': pickedData.address['road'] ?? '',
                'neighbourhood': pickedData.address['neighbourhood'] ?? '',
                'state': pickedData.address['state'] ?? '',
                'country': pickedData.address['country'] ?? '',
                'latitude': pickedData.latLong.latitude,
                'longitude': pickedData.latLong.longitude,
              },
            );
          },
        ),
      ),
    );
  }
}
