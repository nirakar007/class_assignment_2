import 'package:class_assignment_2/cubit/area_circle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaCircleView extends StatelessWidget {
  const AreaCircleView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController radiusController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nirakar, Area of Circle",
          style: TextStyle(fontSize: 14),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Enter the radius of the circle: ",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: radiusController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Radius: ',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  final String input = radiusController.text;
                  if (input.isNotEmpty) {
                    final double radius = double.tryParse(input) ?? 0;
                    if (radius > 0) {
                      context
                          .read<AreaCircleCubit>()
                          .calculateAreaCircle(radius);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Valid numbers only please")));
                    }
                  }
                },
                child: const Text('Calculate Area')),
            const SizedBox(
              height: 16,
            ),
            BlocBuilder<AreaCircleCubit, double>(builder: (context, state) {
              return Text(
                'Area of the circle: ${state.toStringAsFixed(2)} units^2',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              );
            })
          ],
        ),
      ),
    );
  }
}
