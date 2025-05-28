// profile_screen.dart - Updated version with dynamic attendance stats from centralized data
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/screens/edit_profile_screen.dart'; // Import the edit screen

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Sample user data - now mutable to receive updates
  Map<String, dynamic> userData = {
    'name': 'Excella',
    'fullName': 'Excella Brahmantyo Kumoro',
    'role': 'Siswa',
    'nis': '215410064',
    'email': 'excella678@email.com',
    'phone': '0812-3456-7890',
    'address': 'Jl. Pendidikan No. 123, Jakarta Selatan',
    'class': 'X RPL B',
    'joinDate': DateTime(2022, 7, 15),
  };

  // Centralized attendance history data (same as home_screen.dart)
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

  // Calculate current month attendance statistics (same logic as home_screen.dart)
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

    // Combine Hadir and Terlambat for display (same as home screen)
    stats['Hadir'] = stats['Hadir']! + stats['Terlambat']!;

    return stats;
  }

  // Navigate to edit profile screen
  void _navigateToEditProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(userData: userData),
      ),
    );

    // Update the user data if changes were made
    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        userData = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Format join date
    String joinDate;
    try {
      joinDate =
          DateFormat('dd MMMM yyyy', 'id_ID').format(userData['joinDate']);
    } catch (e) {
      joinDate = DateFormat('dd MMMM yyyy').format(userData['joinDate']);
    }

    // Calculate current month stats using the same logic as home screen
    final attendanceStats = _calculateCurrentMonthStats();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Profil Saya",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, // Fixed: Added white color
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.white), // Fixed: Added white color
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
        actions: [
          IconButton(
            icon: const Icon(Icons.edit,
                color: Colors.white), // Fixed: Added white color
            onPressed: _navigateToEditProfile,
            tooltip: 'Edit Profil',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile header with gradient
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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    20, 10, 20, 30), // Fixed: Added top padding consistency
                child: Column(
                  children: [
                    // Profile image
                    Container(
                      width: 120,
                      height: 120,
                      margin: const EdgeInsets.only(top: 20, bottom: 15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 4,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/profile_placeholder.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // User name and role
                    Text(
                      userData['fullName'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(
                            0.2), // Fixed: Consistent with history screen
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        userData['role'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight
                              .w500, // Fixed: Added font weight consistency
                        ),
                      ),
                    ),

                    // Attendance statistics - Now using dynamic data
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatCard('Hadir',
                            attendanceStats['Hadir'].toString(), Colors.green),
                        _buildStatCard('Sakit',
                            attendanceStats['Sakit'].toString(), Colors.blue),
                        _buildStatCard('Izin',
                            attendanceStats['Izin'].toString(), Colors.orange),
                        _buildStatCard('Absen',
                            attendanceStats['Alpa'].toString(), Colors.red),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // User information cards
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Informasi Pribadi",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Personal info card
                  _buildInfoCard([
                    _buildInfoRow("NIS", userData['nis']),
                    _buildInfoRow("Kelas", userData['class']),
                    _buildInfoRow("Tanggal Bergabung", joinDate),
                  ]),

                  const SizedBox(height: 30),
                  const Text(
                    "Kontak",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Contact info card
                  _buildInfoCard([
                    _buildInfoRow("Email", userData['email']),
                    _buildInfoRow("No. Telepon", userData['phone']),
                    _buildInfoRow("Alamat", userData['address']),
                  ]),

                  // Edit profile button
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _navigateToEditProfile,
                      icon: const Icon(Icons.edit, size: 18),
                      label: const Text(
                        "Edit Profil",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFF1A237E),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build attendance stat cards (consistent with history screen)
  Widget _buildStatCard(String title, String count, Color color) {
    return Container(
      width: 70,
      padding:
          const EdgeInsets.symmetric(vertical: 12), // Fixed: Consistent padding
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
              fontWeight:
                  FontWeight.w500, // Fixed: Added font weight consistency
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build info cards
  Widget _buildInfoCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }

  // Helper method to build info rows
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
