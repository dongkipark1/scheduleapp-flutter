// 스케쥴 더미데이터 제공

import 'package:schedulesapp/data/model/schedule.dart';

class FakeScheduleDataSource {
  // 스케쥴 더미 데이터 목록
  List<Schedule> getSchedule() {
    return [
      Schedule(
          id: 1,
          title: '임시 제목 1',
          description: '임시 내용 1',
          dueDate: DateTime.now().add(Duration(days: 1)),
          isCompleted: false,
          createdAt: DateTime.now().subtract(Duration(days: 2))
      ),
      Schedule(
          id: 2,
          title: '임시 제목 2',
          description: '임시 내용 2',
          dueDate: DateTime.now().add(Duration(days: 3)),
          isCompleted: false,
          createdAt: DateTime.now().subtract(Duration(days: 4)),
      ),
    ];
  }
}