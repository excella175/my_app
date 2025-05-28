// home_screen.dart - Updated version with functional logout and attach button
// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/sidebar_component.dart';
import 'package:my_app/screens/profile_screen.dart';
import 'package:my_app/screens/attendance_history_screen.dart';
import 'package:my_app/screens/izin.dart';
import 'package:my_app/screens/setting_screen.dart';

// Import login screen for logout navigation
import 'package:my_app/login_register.dart';

// Import our component files
import 'package:my_app/components/attendance_stat_card.dart';
import 'package:my_app/components/notification_dialog.dart';
import 'package:my_app/components/current_time_display.dart';
import 'package:my_app/components/location_map.dart';
import 'package:my_app/components/attendance_buttons.dart';
import 'package:my_app/components/attendance_history_card.dart';
import 'package:my_app/components/user_profile_header.dart';
import 'package:my_app/components/location_check_handler.dart';
import 'package:my_app/sidebar_menu_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Centralized attendance history data (same as attendance_history_screen.dart)
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

  // Sample data for recent absence history (for display in home screen)
  List<Map<String, dynamic>> get absenceHistory {
    // Get recent 5 records from attendance history, sorted by date descending
    final recentHistory = List<Map<String, dynamic>>.from(_attendanceHistory);
    recentHistory.sort((a, b) => b['date'].compareTo(a['date']));

    return recentHistory
        .take(5)
        .map((record) => {
              'date': DateFormat('MMM, dd').format(record['date']),
              'time': record['time'],
              'status': record['status'],
            })
        .toList();
  }

  // Sample notifications data
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Absen Berhasil',
      'message': 'Absen hari ini telah direkam pada pukul 07:12 AM',
      'time': '2 jam yang lalu',
      'isRead': false
    },
    {
      'title': 'Pengingat Absen',
      'message': 'Jangan lupa absen hari ini sebelum jam 08:00 AM',
      'time': '1 hari yang lalu',
      'isRead': true
    },
    {
      'title': 'Izin Disetujui',
      'message': 'Izin anda pada tanggal 15 Juni telah disetujui',
      'time': '3 hari yang lalu',
      'isRead': true
    },
  ];

  // Scaffold key to control the drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Simulasi status lokasi (bisa diubah untuk testing)
  bool _isInSchoolZone = true; // true = dalam zona, false = luar zona

  // Method to open the drawer
  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  // Count unread notifications
  int get _unreadNotificationCount {
    return notifications
        .where((notification) => notification['isRead'] == false)
        .length;
  }

  // Calculate current month attendance statistics
  Map<String, int> _calculateCurrentMonthStats() {
    final now = DateTime.now();
    final currentMonthRecords = _attendanceHistory.where((record) {
      return record['date'].month == now.month &&
          record['date'].year == now.year;
    }).toList();

    final stats = {
      'Hadir': 0,
      'Sakit': 0,
      'Izin': 0,
      'Alpa': 0,
      'Terlambat': 0
    };

    for (final record in currentMonthRecords) {
      final status = record['status'];
      if (stats.containsKey(status)) {
        stats[status] = stats[status]! + 1;
      }
    }

    // Combine Hadir and Terlambat for display
    stats['Hadir'] = stats['Hadir']! + stats['Terlambat']!;

    return stats;
  }

  // Handle attendance button press
  void _handleAttendancePress() {
    if (!_isInSchoolZone) {
      // Tampilkan peringatan jika di luar zona
      _showLocationWarningDialog();
      return;
    }

    // Jika dalam zona, lanjutkan proses absensi
    LocationCheckHandler.showLocationCheck(
      context: context,
      onSuccess: () {
        _addNewAttendanceRecord();
      },
    );
  }

  // UPDATED: Handle attach button press - Navigate to Leave Request Screen
  void _handleAttachPress() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LeaveRequestScreen(),
      ),
    );
  }

  // Show location warning dialog
  void _showLocationWarningDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.warning, color: Colors.orange[600]),
              const SizedBox(width: 8),
              const Text("Peringatan Lokasi"),
            ],
          ),
          content: const Text(
            "Anda berada di luar zona sekolah. Silakan mendekat ke area sekolah untuk melakukan absensi.",
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Mengerti"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Refresh lokasi (simulasi)
                setState(() {
                  // Untuk demo, kita toggle status lokasi
                  _isInSchoolZone = !_isInSchoolZone;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2196F3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Refresh Lokasi",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  // Add new attendance record
  void _addNewAttendanceRecord() {
    setState(() {
      final now = DateTime.now();
      final newRecord = {
        'date': now,
        'time': DateFormat('hh:mm a').format(now),
        'status': 'Hadir',
        'location': 'MTS Khadijah Malang',
      };
      _attendanceHistory.insert(0, newRecord);
    });

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Absensi berhasil dicatat!"),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  // UPDATED: Logout function - Clear session and navigate to login
  void _performLogout() {
    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Simulate logout delay (you can remove this in production)
    Future.delayed(const Duration(seconds: 1), () {
      // Close loading dialog
      Navigator.of(context).pop();

      // Clear all navigation stack and navigate to login screen
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (Route<dynamic> route) => false,
      );

      // Show logout success message
      Future.delayed(const Duration(milliseconds: 500), () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Berhasil keluar dari akun"),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get current time
    final now = DateTime.now();
    final currentTime = DateFormat('hh:mm a').format(now);

    // Format the date with fallback to prevent locale errors
    String currentDay;
    try {
      currentDay = DateFormat('EEEE, dd MMMM', 'id_ID').format(now);
    } catch (e) {
      currentDay = DateFormat('EEEE, dd MMMM').format(now);
    }

    // Calculate current month stats
    final monthlyStats = _calculateCurrentMonthStats();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[100],
      drawer: _buildSidebar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top section with profile and stats - Now using dynamic data
            UserProfileHeader(
              userName: "excella",
              userRole: "Siswa",
              currentDay: currentDay,
              userImage:
                  const AssetImage('assets/images/profile_placeholder.jpg'),
              onMenuPressed: _openDrawer,
              onNotificationPressed: _showNotifications,
              unreadNotificationCount: _unreadNotificationCount,
              attendanceStats: [
                AttendanceStatCard(
                    title: "Hadir",
                    count: monthlyStats['Hadir'].toString(),
                    color: Colors.green),
                AttendanceStatCard(
                    title: "Sakit",
                    count: monthlyStats['Sakit'].toString(),
                    color: Colors.blue),
                AttendanceStatCard(
                    title: "Izin",
                    count: monthlyStats['Izin'].toString(),
                    color: Colors.orange),
                AttendanceStatCard(
                    title: "Absen",
                    count: monthlyStats['Alpa'].toString(),
                    color: Colors.red),
              ],
            ),

            // Current time display
            CurrentTimeDisplay(currentTime: currentTime),

            // Static Map section - No more Google Maps API needed
            LocationMap(
              title: "Lokasi Absensi",
              markerTitle: "MTS Khadijah Malang",
              height: 200,
              isInZone: _isInSchoolZone, // Pass the zone status
            ),

            // Zone status info card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _isInSchoolZone ? Colors.green[50] : Colors.red[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color:
                      _isInSchoolZone ? Colors.green[200]! : Colors.red[200]!,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    _isInSchoolZone ? Icons.check_circle : Icons.error,
                    color:
                        _isInSchoolZone ? Colors.green[600] : Colors.red[600],
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _isInSchoolZone
                              ? "Anda berada dalam zona sekolah"
                              : "Anda berada di luar zona sekolah",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: _isInSchoolZone
                                ? Colors.green[700]
                                : Colors.red[700],
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          _isInSchoolZone
                              ? "Absensi dapat dilakukan"
                              : "Dekati area sekolah untuk absensi",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Toggle button for demo
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isInSchoolZone = !_isInSchoolZone;
                      });
                    },
                    child: Text(
                      "Toggle",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // UPDATED: Action buttons - Now with functional attach button
            AttendanceButtons(
              onPresentPressed: _handleAttendancePress,
              onAttachPressed:
                  _handleAttachPress, // Now navigates to izin screen
              onPresentTap: () {},
              onAttachTap: () {},
            ),

            // Recent attendance history - Now using dynamic data
            AttendanceHistoryCard(
              absenceHistory: absenceHistory,
              onViewMore: _navigateToAttendanceHistory,
              onViewMoreTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  // Show notifications dialog
  void _showNotifications() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return NotificationDialog(
          notifications: notifications,
          onMarkAllAsRead: () {
            setState(() {
              for (var notification in notifications) {
                notification['isRead'] = true;
              }
            });
            Navigator.pop(context);
          },
          onNotificationTap: (index) {
            setState(() {
              notifications[index]['isRead'] = true;
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  // Navigate to attendance history
  void _navigateToAttendanceHistory() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AttendanceHistoryScreen()),
    );
  }

  // Build the sidebar with improved navigation
  Widget _buildSidebar(BuildContext context) {
    List<SidebarMenuItem> menuItems = [
      SidebarMenuItem(
        icon: Icons.home_rounded,
        title: "Home",
        onTap: () => Navigator.pop(context),
      ),
      SidebarMenuItem(
        icon: Icons.person_rounded,
        title: "Profil Saya",
        onTap: () => _navigateToScreen(ProfileScreen()),
      ),
      SidebarMenuItem(
        icon: Icons.history_rounded,
        title: "Riwayat Absensi",
        onTap: () => _navigateToScreen(AttendanceHistoryScreen()),
      ),
      SidebarMenuItem(
        icon: Icons.medical_services_rounded,
        title: "Ajukan Izin / Sakit",
        onTap: () => _navigateToScreen(LeaveRequestScreen()),
      ),
      SidebarMenuItem(
        icon: Icons.settings_rounded,
        title: "Pengaturan",
        onTap: () => _navigateToScreen(SettingsScreen()),
      ),
    ];

    return SidebarComponent(
      userName: "excella",
      userStatus: "Siswa Aktif",
      userImage: const AssetImage('assets/images/profile_placeholder.jpg'),
      activeIndex: 0,
      menuItems: menuItems,
      onLogout: _showLogoutDialog,
    );
  }

  // Helper method to navigate to screen
  void _navigateToScreen(Widget screen) {
    Navigator.pop(context); // Close sidebar first
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  // UPDATED: Show logout confirmation dialog with functional logout
  void _showLogoutDialog() {
    Navigator.pop(context); // Close sidebar first
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.logout, color: Colors.red[600]),
              const SizedBox(width: 8),
              const Text("Konfirmasi Log Out"),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Apakah Anda yakin ingin Log Out?"),
              const SizedBox(height: 10),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "Batal",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                _performLogout(); // Perform actual logout
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Log Out",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
