class Appointment {
  final String type;
  final double price;
  final String hospital;
  final String location;
  final String waitTime;
  final List<AppointmentSlot> slots;

  Appointment({
    required this.type,
    required this.price,
    required this.hospital,
    required this.location,
    required this.waitTime,
    required this.slots,
  });
}
class AppointmentSlot {
  final String date;
  final String time;
  final bool isAvailable;

  AppointmentSlot({
    required this.date,
    required this.time,
    required this.isAvailable,
  });
}
