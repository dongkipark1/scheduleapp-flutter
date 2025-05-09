import 'package:flutter/material.dart';
import 'package:schedulesapp/data/model/schedule.dart';

class ScheduleDetailPage extends StatelessWidget {
  final Schedule schedule;
  
  const ScheduleDetailPage({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('일정 상세')),
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(schedule.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(schedule.isCompleted ? '완료됨' : '미완료' , style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
