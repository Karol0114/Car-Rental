import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ReservationPage extends StatefulWidget {
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  DateTime? _selectedDay;
  DateTime? _startDay;
  DateTime? _endDay;
  TextEditingController _startDayController = TextEditingController();
  TextEditingController _endDayController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
  }
  // Funkcja do wyboru daty początkowej i końcowej

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      
      if (_startDay != null && _endDay != null) {
        
        _startDay = selectedDay;
        _endDay = null;
        _selectedDay = focusedDay;
      } else if (_startDay == null || (selectedDay.isBefore(_startDay!))) {
        // Jeżeli wybrano datę końcową
        
        _startDay = selectedDay;
        _endDay = null;
      } else if (_endDay == null || selectedDay.isAfter(_startDay!)) {
        // W innym przypadku ustaw jako datę początkową
        _endDay = selectedDay;
      }
    
      // Aktualizacja kontrolerow tekstu

      _startDayController.text = _startDay != null ? '${_startDay!.toLocal()}'.split(' ')[0] : '';
      _endDayController.text = _endDay != null ? '${_endDay!.toLocal()}'.split(' ')[0] : '';
    });
    //
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rezerwacja'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _selectedDay!,
              selectedDayPredicate: (day) {
                return _startDay == day || _endDay == day;
              },
              onDaySelected: _onDaySelected,
              rangeStartDay: _startDay,
              rangeEndDay: _endDay,
              rangeSelectionMode: RangeSelectionMode.enforced,
              calendarStyle: CalendarStyle(
                rangeHighlightColor: Colors.blue[700]!,
                rangeStartDecoration: BoxDecoration(
                  color: Colors.blue[700],
                  shape: BoxShape.circle
                ),
                rangeEndDecoration: BoxDecoration(
                  color: Colors.blue[700],
                  shape: BoxShape.circle
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _startDayController,
                    decoration: const InputDecoration(
                      labelText: 'Początek rezerwacji',
                    ),
                    readOnly: true,
                  ),
                  TextFormField(
                    controller: _endDayController,
                    decoration: const InputDecoration(
                      labelText: 'Koniec rezerwacji',
                    ),
                    readOnly: true,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Logika przycisku OK
                      if (_startDay != null && _endDay!= null) {
                        // Zrealizuj rezerwację
                      }
                    },
                    child: Text('Szukaj'),
                  ),
            // Tutaj możesz dodać inne elementy UI, takie jak przyciski wyboru samochodów itp.
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
