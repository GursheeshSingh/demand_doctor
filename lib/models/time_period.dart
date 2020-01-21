import 'package:demand_doctor/models/time_slot.dart';
import 'package:flutter/cupertino.dart';

class TimePeriod {
  final String name;
  final IconData icon;
  final List<TimeSlot> timeSlots;

  const TimePeriod({this.name, this.icon, this.timeSlots});
}