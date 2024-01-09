import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IP GEO',
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final String apiUrl = 'https://api.techniknews.net/ipgeo';
  Map<String, dynamic> responseData = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));
    
    if (response.statusCode == 200) {
      // La solicitud fue exitosa y puedes manejar los datos aquí.
      final data = json.decode(response.body);
      setState(() {
        responseData = data;
      });
    } else {
      // Si la solicitud no fue exitosa, lidiar con el error.
      print('Error en la solicitud: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Información IP",style: TextStyle(fontWeight: FontWeight.bold),)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("IP",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text("${responseData['ip']}"),
              SizedBox(height: 20),
              Text("País",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text("${responseData['country']}"),
              SizedBox(height: 20),
              Text("Región",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text("${responseData['regionName']}"),
              SizedBox(height: 20),
              Text("Ciudad",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text("${responseData['city']}"),
              SizedBox(height: 20),
              Text("Latitud",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text("${responseData['lat']}"),
              SizedBox(height: 20),
              Text("Longitud",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text("${responseData['lon']}"),
              SizedBox(height: 20),
              Text("Zona Horaria",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text("${responseData['timezone']}"),
              SizedBox(height: 20),
              Text("Zip",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text("${responseData['zip']}"),
              SizedBox(height: 20),
              Text("ISP",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text("${responseData['isp']}"),
              SizedBox(height: 20),
              Text("ORG",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text("${responseData['org']}"),
              SizedBox(height: 20),
              Text("AS",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text("${responseData['as']}"),
              SizedBox(height: 20),
              Text("Proxy",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text("${responseData['proxy']}"),
              SizedBox(height: 20),
              Text("Reversa",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text("${responseData['reverse']}"),
              SizedBox(height: 20),
              // Agrega más Text() según sea necesario para otros datos
            ],
          ),
        ),
      ),
    );
  }
}
