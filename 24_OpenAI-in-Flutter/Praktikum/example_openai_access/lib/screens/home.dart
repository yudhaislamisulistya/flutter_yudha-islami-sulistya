// ignore_for_file: use_build_context_synchronously

import 'package:example_openai_access/screens/result.dart';
import 'package:example_openai_access/services/recomendation_service.dart';
import 'package:flutter/material.dart';

const List<String> carRegions = <String>[
  'Asia',
  'Europe',
  'US',
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  String carRegionValue = carRegions.first;
  bool isLoading = false;

  // other codes…
  void _getRecommendations() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await RecommendationService.getRecommendations(
        carRegion: carRegionValue,
        budget: _controller.value.text,
      );

      if (mounted) {
        setState(() {
          isLoading = false;
        });

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ResultScreen(gptResponseData: result);
            },
          ),
        );
      }
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Failed to send a request. Please try again.'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  // other codes…
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Car Recommendation'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                heightFactor: 4,
                child: Text(
                  'Car Recommendations by AI',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "Choose Car Region",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: DropdownButton<String>(
                  value: carRegionValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  style: const TextStyle(color: Colors.teal),
                  underline: Container(
                    height: 2,
                    color: Colors.tealAccent,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      carRegionValue = value!;
                    });
                  },
                  items: carRegions.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "Please enter your budget in IDR",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Enter a budget (in IDR)',
                  ),
                  validator: (String? value) {
                    bool isInvalid = value == null || value.isEmpty || int.tryParse(value) == null;

                    if (isInvalid) {
                      return 'Please enter valid numbers';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: isLoading && _formKey.currentState!.validate() != false
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: _getRecommendations,
                        child: const Center(
                          child: Text("Get Recommendations"),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
