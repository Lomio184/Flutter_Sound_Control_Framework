import 'package:equalizer/equalizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class CustomEQ extends StatefulWidget {
  const CustomEQ(this.enabled, this.bandLevelRange);

  final bool enabled;
  final List<int>? bandLevelRange;

  @override
  _CustomEQState createState() => _CustomEQState();
}

class _CustomEQState extends State<CustomEQ> {
  double? min, max;
  String? _selectedValue;
  Future<List<String>>? fetchPresets;

  @override
  void initState() {
    super.initState();
    min = widget.bandLevelRange?[0].toDouble();
    max = widget.bandLevelRange?[1].toDouble();
    fetchPresets = Equalizer.getPresetNames();
  }

  @override
  Widget build(BuildContext context) {
    int bandLevel = 0;

    return FutureBuilder<List<int>>(
      future: Equalizer.getCenterBandFreqs(),
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.done
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: snapshot.data!.map((freq) => _buildSliderBand(freq, bandLevel++))
                        .toList(),
                  ),
                ],
              )
            : const CircularProgressIndicator();
      },
    );
  }

  Widget _buildSliderBand(int freq, int bandLevel) {
    return Column(
      children: [
        SizedBox(
          height: 250.0,
          child: FutureBuilder<int>(
            future: Equalizer.getBandLevel(bandLevel),
            builder: (context, snapshot) {
              return FlutterSlider(
                disabled: !widget.enabled,
                axis: Axis.vertical,
                rtl: true,
                min: min,
                max: max,
                values: [snapshot.hasData ? snapshot.data!.toDouble() : 0],
                onDragCompleted: (handlerIndex, lowerValue, upperValue) {
                  Equalizer.setBandLevel(bandLevel, lowerValue.toInt());
                },
              );
            },
          ),
        ),
        Text('${freq ~/ 1000} Hz'),
      ],
    );
  }
}