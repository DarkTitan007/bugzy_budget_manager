import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BudgetWidget extends StatelessWidget {
  final double spent;
  final double budget;

  const BudgetWidget({super.key, required this.spent, required this.budget});

  @override
  Widget build(BuildContext context) {
    double progress = (spent / budget).clamp(0.0, 1.0);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text("Monthly Budget Usage", style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 10),
          SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: budget,
                ranges: <GaugeRange>[
                  GaugeRange(startValue: 0, endValue: budget * 0.5, color: Colors.green),
                  GaugeRange(startValue: budget * 0.5, endValue: budget * 0.8, color: Colors.orange),
                  GaugeRange(startValue: budget * 0.8, endValue: budget, color: Colors.red),
                ],
                pointers: <GaugePointer>[
                  NeedlePointer(value: spent),
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    widget: Text("${(progress * 100).toStringAsFixed(1)}% Used",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    angle: 90,
                    positionFactor: 0.5,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}