// location_map.dart - Static Image Version
import 'package:flutter/material.dart';

class LocationMap extends StatefulWidget {
  final String title;
  final String markerTitle;
  final double height;
  final bool
      isInZone; // Parameter untuk menentukan apakah dalam zona atau tidak

  const LocationMap({
    Key? key,
    this.title = "Lokasi Absensi",
    this.markerTitle = "MTS Khadijah Malang",
    this.height = 200,
    this.isInZone = true, // Default dalam zona
  }) : super(key: key);

  @override
  State<LocationMap> createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulasi loading
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title section with refresh button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              // Button to refresh location
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2196F3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                    // Simulasi refresh
                    Future.delayed(const Duration(seconds: 1), () {
                      if (mounted) {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.my_location,
                    color: Colors.white,
                    size: 18,
                  ),
                  padding: const EdgeInsets.all(8),
                  constraints: const BoxConstraints(
                    minWidth: 36,
                    minHeight: 36,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Map container with static image
          Container(
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Background map image
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: double.infinity,
                    height: widget.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.green[100]!,
                          Colors.blue[100]!,
                        ],
                      ),
                    ),
                    child: Stack(
                      children: [
                        // Simulasi jalan-jalan
                        Positioned(
                          top: 60,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 3,
                            color: Colors.grey[400],
                          ),
                        ),
                        Positioned(
                          top: 120,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 3,
                            color: Colors.grey[400],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 80,
                          child: Container(
                            width: 3,
                            color: Colors.grey[400],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          right: 80,
                          child: Container(
                            width: 3,
                            color: Colors.grey[400],
                          ),
                        ),

                        // Zona sekolah (lingkaran)
                        Center(
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget.isInZone
                                  ? Colors.green.withOpacity(0.2)
                                  : Colors.red.withOpacity(0.2),
                              border: Border.all(
                                color:
                                    widget.isInZone ? Colors.green : Colors.red,
                                width: 2,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                        ),

                        // Gedung sekolah (di tengah)
                        Center(
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.orange[600],
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 4,
                                  offset: const Offset(2, 2),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.school,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),

                        // Marker lokasi user
                        Positioned(
                          top: widget.isInZone
                              ? 90
                              : 30, // Posisi berbeda tergantung zona
                          left: widget.isInZone ? 140 : 60,
                          child: Column(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: widget.isInZone
                                      ? Colors.blue[600]
                                      : Colors.red[600],
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                              // Garis ke marker
                              Container(
                                width: 2,
                                height: 10,
                                color: widget.isInZone
                                    ? Colors.blue[600]
                                    : Colors.red[600],
                              ),
                            ],
                          ),
                        ),

                        // Beberapa pohon/bangunan sebagai dekorasi
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Colors.green[700],
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 30,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: Colors.green[700],
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 40,
                          right: 20,
                          child: Container(
                            width: 20,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Colors.grey[600],
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Loading indicator
                if (isLoading)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFF2196F3),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Memuat lokasi...',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                // Location info overlay
                if (!isLoading)
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.95),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: widget.isInZone
                                ? Colors.green[600]
                                : Colors.red[600],
                            size: 16,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              widget.markerTitle,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          // Status zona
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: widget.isInZone
                                  ? Colors.green[100]
                                  : Colors.red[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              widget.isInZone ? 'Dalam Zona' : 'Luar Zona',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: widget.isInZone
                                    ? Colors.green[700]
                                    : Colors.red[700],
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          // Jarak
                          Text(
                            widget.isInZone ? '15m' : '250m',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
