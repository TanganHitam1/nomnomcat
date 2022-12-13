import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../models/CatsData.dart';

class SfChart extends StatefulWidget {
  final List<CatsData> dataCat;
  const SfChart(this.dataCat, {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<SfChart> createState() => _SfChartState(dataCat);
}

class _SfChartState extends State<SfChart> {
  final List<CatsData> dataCat;
  _SfChartState(this.dataCat);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width * 0.8,
      margin: const EdgeInsets.only(top: 30, left: 5, right: 5),
      padding: const EdgeInsets.all(10),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(200, 255, 255, 255),
          ),
        ),
        SfCartesianChart(
            zoomPanBehavior: ZoomPanBehavior(
                enablePinching: true,
                enableDoubleTapZooming: true,
                enablePanning: true,
                zoomMode: ZoomMode.x),
            plotAreaBorderWidth: 0,
            // plotAreaBackgroundColor:
            //     const Color.fromARGB(255, 10, 42, 83),
            plotAreaBackgroundColor: Colors.white,
            primaryXAxis: CategoryAxis(),
            plotAreaBorderColor: Colors.transparent,
            // Chart title
            title: ChartTitle(text: "NomNom Cat's Data"),

            // Enable legend
            legend: Legend(isVisible: true, position: LegendPosition.bottom),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<CatsData, String>>[
              SplineAreaSeries<CatsData, String>(
                color: const Color.fromARGB(178, 112, 190, 235),
                dataSource: dataCat,
                xValueMapper: (CatsData nom, _) => nom.time,
                yValueMapper: (CatsData nom, _) => nom.come,
                // pointColorMapper: (CatsData nom, _) =>
                //     const Color.fromARGB(178, 112, 190, 235),
                name: "Arrivals Count",

                // Enable data label
              )
            ]),
      ]),
    );
  }
}
