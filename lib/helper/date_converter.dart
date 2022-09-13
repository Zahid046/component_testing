import 'dart:developer';
import 'package:intl/intl.dart';

class DateConverter {
  static String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime);
  }

  static String estimatedDate(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  static String dateTimeStringToDateTime(String dateTime) {
    return DateFormat('dd MMM yyyy  ${_timeFormatter('24')}').format(DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateTime));
  }

  static String dateTimeStringToDateOnly(String dateTime) {
    return DateFormat('dd MMM yyyy').format(DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateTime));
  }

  static DateTime dateTimeStringToDate(String dateTime) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateTime);
  }

  static DateTime convertStringToDateTime(String dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').parse(dateTime);
  }

  static DateTime isoStringToLocalDate(String dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').parse(dateTime);
  }

  static String isoStringToLocalTimeOnly(String dateTime) {
    return DateFormat(_timeFormatter('24')).format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalDateOnly(String dateTime) {
    return DateFormat('dd MMM yyyy').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalAMPM(String dateTime) {
    return DateFormat('a').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalDateAnTime(String dateTime) {
    return DateFormat('dd/MMM/yyyy ${_timeFormatter('24')}').format(isoStringToLocalDate(dateTime));
  }

  static String localDateToIsoString(DateTime dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(dateTime);
  }

  static String convertTimeToTime(String time) {
    return DateFormat(_timeFormatter('24')).format(DateFormat('hh:mm:ss').parse(time));
  }

  static int timeDistanceInMin(String time) {
    DateTime _currentTime = DateTime.now();
    DateTime _rangeTime = dateTimeStringToDate(time);
    return _currentTime.difference(_rangeTime).inMinutes;
  }

  static String _timeFormatter(format) {
    return format == '24' ? 'HH:mm' : 'hh:mm a';
  }

  static int differenceInMinute(String deliveryTime, String orderTime, int processingTime, String scheduleAt) {
    int _minTime = processingTime;
    if (deliveryTime.isNotEmpty) {
      try {
        List<String> _timeList = deliveryTime.split('-');
        _minTime = int.parse(_timeList[0]);
      } catch (e) {
        log('Exception: ${e.toString()}');
      }
    }
    DateTime _deliveryTime = dateTimeStringToDate(scheduleAt).add(Duration(minutes: _minTime));
    return _deliveryTime.difference(DateTime.now()).inMinutes;
  }

  static bool isBeforeTime(String dateTime) {
    DateTime scheduleTime = dateTimeStringToDate(dateTime);
    return scheduleTime.isBefore(DateTime.now());
  }
}
