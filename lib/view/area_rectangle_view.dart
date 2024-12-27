import 'package:class_assignment_2/cubit/area_rectangle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaRectangleView extends StatelessWidget {
  const AreaRectangleView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController lengthController = TextEditingController();
    final TextEditingController breadthController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nirakar, Area of Rectangle",
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
              "Enter the dimensions of the rectangle:",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: lengthController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Length:',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: breadthController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Breadth:',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  final String lengthInput = lengthController.text;
                  final String breadthInput = breadthController.text;
                  if (lengthInput.isNotEmpty && breadthInput.isNotEmpty) {
                    final double length = double.tryParse(lengthInput) ?? 0;
                    final double breadth = double.tryParse(breadthInput) ?? 0;

                    if (length > 0 && breadth > 0) {
                      context
                          .read<AreaRectangleCubit>()
                          .calculateAreaRectangle(length, breadth);
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
            BlocBuilder<AreaRectangleCubit, double>(builder: (context, state) {
              return Text(
                'Area of the rectangle: ${state.toStringAsFixed(2)} units^2',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              );
            })
          ],
        ),
      ),
    );
  }
}
