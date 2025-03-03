//meter = (ft * 12 + inch) * 0.0254;
//     ans = wt / (meter * meter);

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class bmiCalculator extends StatefulWidget {
  const bmiCalculator({super.key});

  @override
  State<bmiCalculator> createState() => _bmiCalculatorState();
}

class _bmiCalculatorState extends State<bmiCalculator> {

  TextEditingController ageTEController = TextEditingController();
  TextEditingController heightInFitTEController = TextEditingController();
  TextEditingController heightInInchTEController = TextEditingController();
  TextEditingController weightTEController = TextEditingController();

  double meter = 0;
  double bmi = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Colors.green.shade200,
        foregroundColor: Colors.black,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.replay_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50,
                    child: TextField(
                      controller: ageTEController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Age'),
                    ),
                  ),

                  SizedBox(
                    width: 60,
                    child: TextField(
                      controller: heightInFitTEController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Hit(fit)'),
                    ),
                  ),

                  SizedBox(
                    width: 50,
                    child: TextField(
                      controller: heightInInchTEController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Hit(in)'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.female)),
                  Text('|', style: TextStyle(fontSize: 24),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.male)),

                  SizedBox(width: 24,),
                  SizedBox(
                    width: 90,
                    child: TextField(
                      controller: weightTEController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Weight(kg)'
                      ),
                    ),
                  ),

                  IconButton(onPressed: (){
                    double heightInFit = double.parse(heightInFitTEController.text);
                    double heightInInch = double.parse(heightInInchTEController.text);
                    double weight = double.parse(weightTEController.text);

                    meter = (heightInFit * 12 + heightInInch) * 0.0254;
                    bmi = weight /(meter *meter);
                    setState(() {

                    });
                  }, icon: Icon(Icons.check))
                ],
              ),

              const SizedBox(height: 30,),

              Container(
                height: 250,
                width: 300,
                child: SfRadialGauge(
                  axes: [
                    RadialAxis(
                      minimum:16, maximum: 41,
                      ranges: [
                        GaugeRange(startValue: 16, endValue: 18.5, color: Colors.green,),
                        GaugeRange(startValue: 18.6, endValue: 25.3, color: Colors.orange,),
                        GaugeRange(startValue: 25.4, endValue: 41, color: Colors.red,),
                      ],pointers: [
                      NeedlePointer(value: bmi,enableAnimation: true,)
                    ],
                      annotations: [
                        GaugeAnnotation(
                          widget: Container(
                            child: Text(
                              bmi.toString(),
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          angle: 90,
                          positionFactor: .5,
                        )
                      ],
                    )
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Very Severely Underweight',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: bmi <= 15.9
                                ? Colors.green
                                : Colors.black,
                            letterSpacing: 0.4
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        '<- 15.9',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          // color: (ans?.toDouble() ?? 0) <= 15.9
                          //     ? Colors.green
                          //     : Colors.black,
                          // letterSpacing: 0.4
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Severely Underweight',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          // color: ((ans?.toDouble() ?? 0) >= 16.0 &&
                          //     (ans?.toDouble() ?? 0) <= 16.9)
                          //     ? Colors.green
                          //     : Colors.black,
                          // letterSpacing: 0.4
                        ),
                      ),
                      Text(
                        '16.0 - 16.9',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          // color: ((ans?.toDouble() ?? 0) >= 16.0 &&
                          //     (ans?.toDouble() ?? 0) <= 16.9)
                          //     ? Colors.green
                          //     : Colors.black,
                          // letterSpacing: 0.4
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Underweight',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          // color: ((ans?.toDouble() ?? 0) >= 17.0 &&
                          //     (ans?.toDouble() ?? 0) <= 18.4)
                          //     ? Colors.green
                          //     : Colors.black,
                          // letterSpacing: 0.4
                        ),
                      ),
                      Text(
                        '17.0 - 18.4',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          // color: ((ans?.toDouble() ?? 0) >= 17.0 &&
                          //     (ans?.toDouble() ?? 0) <= 18.4)
                          //     ? Colors.green
                          //     : Colors.black,
                          // letterSpacing: 0.4
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Normal',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          // color: ((ans?.toDouble() ?? 0) >= 18.5 &&
                          //     (ans?.toDouble() ?? 0) <= 24.9)
                          //     ? Colors.green
                          //     : Colors.black,
                          // letterSpacing: 0.4
                        ),
                      ),
                      Text(
                        '18.5 - 24.9',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          // color: ((ans?.toDouble() ?? 0) >= 18.5 &&
                          //     (ans?.toDouble() ?? 0) <= 24.9)
                          //     ? Colors.green
                          //     : Colors.black,
                          // letterSpacing: 0.4
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Overweight',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          // color: ((ans?.toDouble() ?? 0) >= 25.0 &&
                          //     (ans?.toDouble() ?? 0) <= 29.9)
                          //     ? Colors.green
                          //     : Colors.black,
                          // letterSpacing: 0.4
                        ),
                      ),
                      Text(
                        '25.0 - 29.9',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          // color: ((ans?.toDouble() ?? 0) >= 25.0 &&
                          //     (ans?.toDouble() ?? 0) <= 29.9)
                          //     ? Colors.green
                          //     : Colors.black,
                          // letterSpacing: 0.4
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Obese Class |',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          // color: ((ans?.toDouble() ?? 0) >= 30.0 &&
                          //     (ans?.toDouble() ?? 0) <= 34.9)
                          //     ? Colors.green
                          //     : Colors.black,
                          // letterSpacing: 0.4
                        ),
                      ),
                      Text(
                        '30.0 - 34.9',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          // color: ((ans?.toDouble() ?? 0) >= 30.0 &&
                          //     (ans?.toDouble() ?? 0) <= 34.9)
                          //     ? Colors.green
                          //     : Colors.black,
                          // letterSpacing: 0.4
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Obese Class ||',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          // color: ((ans?.toDouble() ?? 0) >= 35.0 &&
                          //     (ans?.toDouble() ?? 0) <= 39.9)
                          //     ? Colors.green
                          //     : Colors.black,
                          // letterSpacing: 0.4
                        ),
                      ),
                      Text(
                        '35.0 - 39.9',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          // color: ((ans?.toDouble() ?? 0) >= 35.0 &&
                          //     (ans?.toDouble() ?? 0) <= 39.9)
                          //     ? Colors.green
                          //     : Colors.black,
                          // letterSpacing: 0.4
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Obese Class |||',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          // color: (ans?.toDouble() ?? 0) >= 45.0
                          //     ? Colors.green
                          //     : Colors.black,
                          // letterSpacing: 0.4
                        ),
                      ),
                      Text(
                        '>= 45.0',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          // color: (ans?.toDouble() ?? 0) >= 45.0
                          //     ? Colors.green
                          //     : Colors.black,
                          // letterSpacing: 0.4
                        ),
                      )
                    ],
                  ),
                ],
              ),

              SizedBox(height: 25,),

              const Text('Normal Weight: 119 - 180', style: TextStyle(color: Colors.red, fontSize: 24),)
            ],
          ),
        ),
      ),
    );
  }
}