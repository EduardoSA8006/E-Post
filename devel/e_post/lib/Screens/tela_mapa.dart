import 'package:e_post/Screens/functionsScreens/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart' as latLng2;

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  latLng2.LatLng? _mapCenter;

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // O usuário ainda negou a permissão
        print('Permissão de localização negada.');
        return; // Pode decidir o que fazer a seguir, como mostrar um alerta
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // O usuário negou a permissão permanentemente
      print('Permissão de localização negada para sempre.');
      return; // Pode decidir o que fazer a seguir
    }

    // Se a permissão for concedida, obtenha a localização
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _mapCenter = latLng2.LatLng(position.latitude,
            position.longitude); // Usando latLng2.LatLng aqui também
      });
    } catch (e) {
      // Trate erros, como quando não é possível obter a localização
      print('Erro ao obter a localização: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mapa',
          style: GoogleFonts.inter(fontSize: 22),
        ),
      ),
      body: _mapCenter ==
              null // Exibe um carregando enquanto a localização não é obtida
          ? Center(child: CircularProgressIndicator())
          : FlutterMap(
              options: MapOptions(
                initialCenter: _mapCenter!,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
              ],
            ),
      bottomNavigationBar: barraInferior(context),
    );
  }
}
