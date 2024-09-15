import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:web_dashboard/widgets/product_table.dart';

class RevenueLocationCard extends StatefulWidget {
  @override
  _RevenueLocationCardState createState() => _RevenueLocationCardState();
}

class _RevenueLocationCardState extends State<RevenueLocationCard> {
  String? _hoveredCountry;
  Offset? _hoveredPosition;

  final List<Map<String, LatLng>> _countryMarkers = [
    {'United States': const LatLng(37.7749, -122.4194)},
    {'Germany': const LatLng(51.1657, 10.4515)},
    {'China': const LatLng(35.8617, 104.1954)},
    {'France': const LatLng(48.8566, 2.3522)},
    {'Italy': const LatLng(41.9028, 12.4964)},
    {'Belgium': const LatLng(50.8503, 4.3517)},
    {'United Kingdom': const LatLng(51.5074, -0.1278)},
    {'Russia': const LatLng(55.7558, 37.6173)},
  ];

  void _onHover(PointerHoverEvent event) {
    LatLng position = _convertToLatLng(event.localPosition);

    for (var marker in _countryMarkers) {
      String country = marker.keys.first;
      LatLng coords = marker[country]!;

      if ((position.latitude - coords.latitude).abs() < 10 &&
          (position.longitude - coords.longitude).abs() < 10) {
        setState(() {
          _hoveredCountry = country;
          _hoveredPosition = event.localPosition;
        });
        return;
      }
    }

    setState(() {
      _hoveredCountry = null;
      _hoveredPosition = null;
    });
  }

  LatLng _convertToLatLng(Offset offset) {
    double latitude = 20.0 + (offset.dy / 300) * 60;
    double longitude = (offset.dx / 400) * 360 - 180;
    return LatLng(latitude, longitude);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Expanded(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Revenue by Location and Country'),
                    Icon(
                      Icons.menu,
                    )
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Map Section
                    Expanded(
                      flex:
                          2, // Adjust the flex according to your layout preference
                      child: MouseRegion(
                        onHover: _onHover,
                        child: Stack(
                          children: [
                            Container(
                              height: 300,
                              child: FlutterMap(
                                options: MapOptions(
                                  initialCenter: const LatLng(20.0, 0.0),
                                  initialZoom: 2,
                                  maxZoom: 10,
                                  minZoom: 2,
                                  interactionOptions: InteractionOptions(
                                    cursorKeyboardRotationOptions:
                                        CursorKeyboardRotationOptions
                                            .disabled(),
                                    flags: InteractiveFlag.all,
                                  ),
                                ),
                                children: [
                                  TileLayer(
                                    urlTemplate:
                                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                    userAgentPackageName:
                                        'dev.fleaflet.flutter_map.example',
                                    tileProvider:
                                        CancellableNetworkTileProvider(),
                                  ),
                                  MarkerLayer(
                                    markers: _countryMarkers.map((marker) {
                                      String country = marker.keys.first;
                                      LatLng point = marker[country]!;
                                      return _buildMarker(point, country);
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                            if (_hoveredCountry != null &&
                                _hoveredPosition != null)
                              Positioned(
                                left: _hoveredPosition!.dx + 10,
                                top: _hoveredPosition!.dy - 30,
                                child: Material(
                                  elevation: 4,
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    color: Colors.white,
                                    child: Text(
                                      _hoveredCountry!,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    // Bar Chart Section
                    Expanded(
                      flex:
                          1, // Adjust the flex according to your layout preference
                      child: Container(
                        height: 300,
                        padding: const EdgeInsets.all(8.0),
                        child: RevenueBarChart(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Marker _buildMarker(LatLng point, String country) {
    return Marker(
      width: 50.0,
      height: 50.0,
      point: point,
      child: InkWell(
        onTap: () {},
        child: Container(
          child: const Icon(Icons.circle, color: Colors.blue, size: 10),
        ),
      ),
    );
  }
}

class RevenueBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = [
      RevenueData('India', 80),
      RevenueData('China', 75),
      RevenueData('United States', 90),
      RevenueData('Japan', 50),
      RevenueData('France', 60),
      RevenueData('Italy', 30),
      RevenueData('Netherlands', 40),
      RevenueData('United Kingdom', 70),
      RevenueData('Canada', 20),
      RevenueData('South Korea', 55),
    ];

    var series = [
      charts.Series<RevenueData, String>(
        id: 'Revenue',
        colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
        domainFn: (RevenueData revenue, _) => revenue.country,
        measureFn: (RevenueData revenue, _) => revenue.revenue,
        data: data,
      ),
    ];

    return charts.BarChart(
      series,
      animate: true,
      vertical: false, // Set this to false for a horizontal bar chart
      //   barRendererDecorator: charts.BarLabelDecorator<String>(),
      domainAxis: const charts.OrdinalAxisSpec(
        showAxisLine: true,
        renderSpec: charts.SmallTickRendererSpec(
          labelStyle: charts.TextStyleSpec(
            fontSize: 12,
            color: charts.MaterialPalette.black,
          ),
        ),
      ),
      primaryMeasureAxis: const charts.NumericAxisSpec(
        showAxisLine: true,
        renderSpec: charts.GridlineRendererSpec(
          labelStyle: charts.TextStyleSpec(
            fontSize: 12,
            color: charts.MaterialPalette.black,
          ),
        ),
      ),
    );
  }
}

class RevenueData {
  final String country;
  final int revenue;

  RevenueData(this.country, this.revenue);
}
