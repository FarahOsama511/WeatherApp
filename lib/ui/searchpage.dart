import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheather/models/api/apiservice.dart';
import 'package:wheather/models/weathermodel.dart';
import 'package:wheather/provider/providermodel.dart';
import 'package:wheather/ui/homescreen.dart';
import 'package:wheather/ui/widgets/textfield.dart';

class Searchpage extends StatefulWidget {
  Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    final weatherdata = Provider.of<Providermodel>(context);
    return Scaffold(
      body: Center(
        child: Textfield(
          onchanged: (data) {
            cityName = data;
          },
          onsubmitted: (value) async {
            cityName = value;
            weatherdata.cityName = cityName;
            await weatherdata.fetchWeather(cityName!);

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WeatherPage();
            }));
          },
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
                onPressed: () async {
                  weatherdata.cityName = cityName;
                  await weatherdata.fetchWeather(cityName!);

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WeatherPage();
                  }));
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          ),
        ),
      ),
    );
  }
}
