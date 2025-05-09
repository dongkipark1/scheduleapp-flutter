import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schedulesapp/data/model/schedule.dart';
import 'package:schedulesapp/presentation/viewmodel/schedule_list_viewmodel.dart';

class ScheduleFormPage extends ConsumerStatefulWidget {
  const ScheduleFormPage({super.key});

  @override
  ConsumerState<ScheduleFormPage> createState() => _ScheduleFormPageState();
}

class _ScheduleFormPageState extends ConsumerState<ScheduleFormPage> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  DateTime? dueDate;
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('새 일정 추가')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: '제목'),
                validator: (value) => value == null || value.isEmpty ? '필수 입력 사항입니다' : null,
                onSaved: (value) => title == value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: '설명'),
                onSaved: (value) => description = value ?? '',
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(dueDate == null ? '마감일 선택 안됨' : '마감일: ${dueDate!.toLocal()}'),
                  const Spacer(),
                  ElevatedButton(
                      onPressed: () async {
                        final selected = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                        );
                        if(selected != null){
                          setState(() => dueDate = selected);
                        }
                      },
                      child: const Text('마감일 선택'),
                  )
                ],
              ),
              SwitchListTile(
                  value: isCompleted,
                  title: const Text('완료 여부'),
                  onChanged: (value) {
                    setState(() => isCompleted = value);
                  }
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState?.validate() ?? false){
                      _formKey.currentState?.save();

                      if(dueDate == null) return;
                      ref.read(scheduleListViewModelProvider.notifier).addSchedule(
                        title: title,
                        description: description,
                        dueDate: dueDate ?? DateTime.now(),
                        isCompleted: isCompleted,
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('저장'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
