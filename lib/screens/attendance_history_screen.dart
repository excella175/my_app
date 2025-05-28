// attendance_history_screen.dart - Updated with more data and consistent design
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceHistoryScreen extends StatefulWidget {
  const AttendanceHistoryScreen({super.key});

  @override
  State<AttendanceHistoryScreen> createState() =>
      _AttendanceHistoryScreenState();
}

class _AttendanceHistoryScreenState extends State<AttendanceHistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Extended attendance history data with more entries
  final List<Map<String, dynamic>> _attendanceHistory = [
    // Juni 2024
    {
      'date': DateTime(2024, 6, 25),
      'time': '07:08 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2024, 6, 24),
      'time': '07:15 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2024, 6, 23),
      'time': '07:05 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2024, 6, 22),
      'time': '07:45 AM',
      'status': 'Terlambat',
      'location': 'MTS Khadijah Malang',
      'note': 'Terlambat 15 menit karena macet',
    },
    {
      'date': DateTime(2024, 6, 21),
      'time': '07:12 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2024, 6, 20),
      'time': '07:15 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2024, 6, 19),
      'time': '07:10 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2024, 6, 18),
      'time': '07:12 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2024, 6, 17),
      'time': '07:45 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2024, 6, 16),
      'time': '-',
      'status': 'Sakit',
      'location': '-',
      'note': 'Demam dan flu',
    },
    {
      'date': DateTime(2024, 6, 15),
      'time': '-',
      'status': 'Izin',
      'location': '-',
      'note': 'Urusan keluarga',
    },
    {
      'date': DateTime(2024, 6, 14),
      'time': '07:28 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2024, 6, 13),
      'time': '07:05 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2024, 6, 12),
      'time': '08:10 AM',
      'status': 'Terlambat',
      'location': 'MTS Khadijah Malang',
      'note': 'Terlambat 10 menit',
    },
    {
      'date': DateTime(2024, 6, 11),
      'time': '-',
      'status': 'Alpa',
      'location': '-',
    },
    {
      'date': DateTime(2024, 6, 10),
      'time': '07:20 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2024, 6, 9),
      'time': '07:18 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2024, 6, 8),
      'time': '07:25 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2024, 6, 7),
      'time': '-',
      'status': 'Sakit',
      'location': '-',
      'note': 'Batuk dan pilek',
    },
    {
      'date': DateTime(2024, 6, 6),
      'time': '07:14 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    // Mei 2024
    {
      'date': DateTime(2024, 5, 31),
      'time': '07:22 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2024, 5, 30),
      'time': '07:16 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2024, 5, 29),
      'time': '07:08 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2024, 5, 28),
      'time': '07:55 AM',
      'status': 'Terlambat',
      'location': 'MTS Khadijah Malang',
      'note': 'Terlambat 25 menit',
    },
    {
      'date': DateTime(2024, 5, 27),
      'time': '07:12 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2024, 5, 26),
      'time': '-',
      'status': 'Alpa',
      'location': '-',
    },
    {
      'date': DateTime(2024, 5, 25),
      'time': '07:18 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2024, 5, 24),
      'time': '-',
      'status': 'Izin',
      'location': '-',
      'note': 'Acara keluarga',
    },
    {
      'date': DateTime(2024, 5, 23),
      'time': '07:11 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2024, 5, 22),
      'time': '07:28 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    // Data untuk bulan sekarang (Mei 2025)
    {
      'date': DateTime(2025, 5, 23),
      'time': '07:15 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2025, 5, 22),
      'time': '07:08 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2025, 5, 21),
      'time': '07:25 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2025, 5, 20),
      'time': '07:52 AM',
      'status': 'Terlambat',
      'location': 'MTS Khadijah Malang',
      'note': 'Terlambat 22 menit',
    },
    {
      'date': DateTime(2025, 5, 19),
      'time': '-',
      'status': 'Sakit',
      'location': '-',
      'note': 'Flu dan demam',
    },
    {
      'date': DateTime(2025, 5, 16),
      'time': '07:12 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2025, 5, 15),
      'time': '07:18 AM',
      'status': 'Hadir',
      'location': 'MTS Khadijah Malang',
    },
    {
      'date': DateTime(2025, 5, 14),
      'time': '-',
      'status': 'Izin',
      'location': '-',
      'note': 'Keperluan keluarga',
    },
  ];

  // Note: Stats are calculated dynamically from the data

  // Filter active month
  int _activeMonth = DateTime.now().month;
  int _activeYear = DateTime.now().year;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Filter history by active month
    final filteredHistory = _attendanceHistory.where((record) {
      return record['date'].month == _activeMonth &&
          record['date'].year == _activeYear;
    }).toList();

    // Calculate monthly stats
    final monthlyStats = _calculateMonthlyStats(filteredHistory);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Riwayat Absensi",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF1A237E), // Deep blue
                Color(0xFF2196F3), // Light blue
              ],
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Month selector and stats section
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1A237E), // Deep blue
                  Color(0xFF2196F3), // Light blue
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
            child: Column(
              children: [
                // Month selection
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (_activeMonth == 1) {
                            _activeMonth = 12;
                            _activeYear--;
                          } else {
                            _activeMonth--;
                          }
                        });
                      },
                      icon: const Icon(Icons.chevron_left, color: Colors.white),
                    ),
                    Text(
                      _getMonthYearString(_activeMonth, _activeYear),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (_activeMonth == 12) {
                            _activeMonth = 1;
                            _activeYear++;
                          } else {
                            _activeMonth++;
                          }
                        });
                      },
                      icon:
                          const Icon(Icons.chevron_right, color: Colors.white),
                    ),
                  ],
                ),

                // Monthly attendance statistics
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatCard('Hadir', monthlyStats['Hadir'].toString(),
                        Colors.green),
                    _buildStatCard(
                        'Sakit', monthlyStats['Sakit'].toString(), Colors.blue),
                    _buildStatCard(
                        'Izin', monthlyStats['Izin'].toString(), Colors.orange),
                    _buildStatCard(
                        'Absen', monthlyStats['Alpa'].toString(), Colors.red),
                  ],
                ),
              ],
            ),
          ),

          // Tab bar for filtering
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: const Color(0xFF1A237E),
              unselectedLabelColor: Colors.grey,
              indicatorColor: const Color(0xFF1A237E),
              tabs: const [
                Tab(text: "Semua"),
                Tab(text: "Hadir"),
                Tab(text: "Izin/Sakit"),
                Tab(text: "Absen"),
              ],
            ),
          ),

          // Attendance list
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // All attendance records
                _buildAttendanceList(filteredHistory),

                // Present only
                _buildAttendanceList(filteredHistory
                    .where((record) =>
                        record['status'] == 'Hadir' ||
                        record['status'] == 'Terlambat')
                    .toList()),

                // Leave/Sick only
                _buildAttendanceList(filteredHistory
                    .where((record) =>
                        record['status'] == 'Izin' ||
                        record['status'] == 'Sakit')
                    .toList()),

                // Absent only
                _buildAttendanceList(filteredHistory
                    .where((record) => record['status'] == 'Alpa')
                    .toList()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Calculate monthly statistics
  Map<String, int> _calculateMonthlyStats(List<Map<String, dynamic>> records) {
    final stats = {
      'Hadir': 0,
      'Sakit': 0,
      'Izin': 0,
      'Alpa': 0,
      'Terlambat': 0
    };

    for (final record in records) {
      final status = record['status'];
      if (stats.containsKey(status)) {
        stats[status] = stats[status]! + 1;
      }
    }

    // Combine Hadir and Terlambat for display
    stats['Hadir'] = stats['Hadir']! + stats['Terlambat']!;

    return stats;
  }

  // Helper method to get formatted month and year
  String _getMonthYearString(int month, int year) {
    final date = DateTime(year, month);
    try {
      return DateFormat('MMMM yyyy', 'id_ID').format(date);
    } catch (e) {
      return DateFormat('MMMM yyyy').format(date);
    }
  }

  // Helper method to build attendance stat cards (consistent with home screen)
  Widget _buildStatCard(String title, String count, Color color) {
    return Container(
      width: 70,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            count,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build the attendance list
  Widget _buildAttendanceList(List<Map<String, dynamic>> records) {
    if (records.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_busy,
              size: 80,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              "Tidak ada data absensi",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "untuk bulan yang dipilih",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: records.length,
      itemBuilder: (context, index) {
        final record = records[index];

        // Format the date
        String formattedDate;
        try {
          formattedDate =
              DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(record['date']);
        } catch (e) {
          formattedDate =
              DateFormat('EEEE, dd MMMM yyyy').format(record['date']);
        }

        return Card(
          elevation: 3,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Colors.grey[50]!,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date and status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          formattedDate,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF1A237E),
                          ),
                        ),
                      ),
                      _buildStatusChip(record['status']),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Divider(height: 1, thickness: 1, color: Colors.grey[200]),
                  const SizedBox(height: 12),

                  // Time and location
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 18,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Jam: ${record['time']}",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 18,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Lokasi: ${record['location']}",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Note if available
                  if (record.containsKey('note') && record['note'] != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.note,
                            size: 18,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "Catatan: ${record['note']}",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Helper method to build status chip (consistent with home screen)
  Widget _buildStatusChip(String status) {
    Color chipColor;
    Color textColor = Colors.white;

    switch (status) {
      case 'Hadir':
        chipColor = Colors.green;
        break;
      case 'Sakit':
        chipColor = Colors.blue;
        break;
      case 'Izin':
        chipColor = Colors.orange;
        break;
      case 'Terlambat':
        chipColor = Colors.amber[600]!;
        break;
      case 'Alpa':
        chipColor = Colors.red;
        break;
      default:
        chipColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: chipColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: chipColor.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        status,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
