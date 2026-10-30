
import 'package:flutter/material.dart';

void main() {
  runApp(const WaterTrackerApp());
}

class WaterTrackerApp extends StatelessWidget {
  const WaterTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WaterTrackerScreen(),
    );
  }
}

class WaterTrackerScreen extends StatefulWidget {
  const WaterTrackerScreen({super.key});

  @override
  State<WaterTrackerScreen> createState() =>
      _WaterTrackerScreenState();
}

class _WaterTrackerScreenState
    extends State<WaterTrackerScreen> {
  int glasses = 0;
  final int dailyGoal = 8;

  void addGlass() {
    setState(() {
      if (glasses < dailyGoal) {
        glasses++;
      }
    });
  }

  void resetTracker() {
    setState(() {
      glasses = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF5FF),
      appBar: AppBar(
        title: const Text('Water Tracker'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.water_drop,
                size: 90,
                color: Colors.blue,
              ),

              const SizedBox(height: 20),

              const Text(
                'Stay Hydrated!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Track your daily water intake',
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 30),

              Text(
                '$glasses / $dailyGoal glasses',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),

              const SizedBox(height: 15),

              LinearProgressIndicator(
                value: glasses / dailyGoal,
                minHeight: 12,
                backgroundColor: Colors.blue.shade100,
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: addGlass,
                icon: const Icon(Icons.add),
                label: const Text('Add a Glass'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              OutlinedButton.icon(
                onPressed: resetTracker,
                icon: const Icon(Icons.refresh),
                label: const Text('Reset'),
              ),

              const SizedBox(height: 20),

              Text(
                glasses == dailyGoal
                    ? 'Daily goal completed! Great job!'
                    : 'Keep drinking water!',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}