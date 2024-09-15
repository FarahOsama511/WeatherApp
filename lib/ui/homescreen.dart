import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wheather/provider/providermodel.dart';
import 'package:wheather/ui/searchpage.dart';
import 'package:wheather/ui/widgets/errorpage.dart';
import 'package:glass_kit/glass_kit.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    final weatherdata = Provider.of<Providermodel>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(77, 6, 8, 71),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Searchpage()),
                );
              },
            ),
          ],
        ),
        body: weatherdata.Data == null
            ? Errorpage(error: weatherdata.errormassege ?? " Error")
            : Center(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromARGB(77, 6, 8, 71),
                    Color.fromARGB(255, 30, 20, 20)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        weatherdata.cityName!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        '${weatherdata.fiveDayWeather[0].temp.toInt().toString()}°',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 55,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '${weatherdata.fiveDayWeather[0].description}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        DateFormat('d MMM,EEEE').format(DateTime.now()),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        DateFormat.Hm().format(DateTime.now()),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 180,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GlassContainer.clearGlass(
                            borderColor: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            child: ListView.builder(
                                itemExtent: 80,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: weatherdata.hourlyData.length,
                                itemBuilder: (context, index) {
                                  final data = weatherdata.hourlyData[index];
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${data.temp.toInt()}°C',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      Image.network(
                                        'https://openweathermap.org/img/wn/${data.icon}@2x.png',
                                        scale: 1.5,
                                      ),
                                      Text(
                                        DateFormat.jm().format(data.dt_txt),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: GlassContainer.clearGlass(
                            borderColor: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            width: double.infinity,
                            height: 300,
                            padding: const EdgeInsets.only(
                                left: 9, right: 4, bottom: 9),
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemExtent: 60,
                              itemCount: weatherdata.hourlyData.length,
                              itemBuilder: (context, index) {
                                final weather = weatherdata.hourlyData[index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        DateFormat('EEEE')
                                            .format(weather.dt_txt),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        '${weather.temp.toInt()} °C',
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      Image.network(
                                        'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
                                        scale: 1,
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
