import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedulesapp/presentation/viewmodel/schedule_list_viewmodel.dart';

class ScheduleListPage extends ConsumerWidget {
  const ScheduleListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheduleList = ref.watch(scheduleListViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('일정 목록')),
      body: ListView.builder(
        itemCount: scheduleList.length,
        itemBuilder: (context, index) {
          final schedule = scheduleList[index];
          return ListTile(
            title: Text(schedule.title),
            subtitle: Text(schedule.description),
            trailing: Icon(schedule.isCompleted ?
            Icons.check_circle :
            Icons.circle_outlined),
          );
        },
      ),
    );
  }
}
