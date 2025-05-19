import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/complete_profile_controller.dart';

class CompleteProfileView extends GetView<CompleteProfileController> {
  const CompleteProfileView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          final step = controller.currentStep.value;
          final titles = [
            "Informasi Profil\nRincian profil dasar",
            "Informasi Profil\nRincian profil lanjutan",
            "Informasi Profil\nRincian spesialisasi pengajar",
          ];
          final progress = [0.33, 0.66, 1.0];
          final stepText = ["Tahap 1 dari 3", "Tahap 2 dari 3", "Tahap 3 dari 3"];

          return Column(
            children: [
              // Header sesuai dengan gambar yang diberikan
              Stack(
                children: [
                  // Background navy blue dengan bentuk yang dimodifikasi
                  Container(
                    width: double.infinity,
                    height: 120,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1B263B),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                          const Spacer(),
                          const Text(
                            "Lengkapi Profil Anda",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          const SizedBox(width: 36),
                        ],
                      ),
                    ),
                  ),
                  
                  // Avatar position - digeser lebih ke bawah
                  Positioned(
                    bottom: -30,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                        ),
                        // Tambahkan icon kamera untuk menunjukkan ini adalah tombol upload foto
                        child: const Center(
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.grey,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  // Add button - tetap tampilkan dengan posisi yang sesuai
                  Positioned(
                    bottom: -20,
                    right: 0,
                    left: 35,
                    child: Center(
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1B263B),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              // Tambahkan space untuk mengakomodasi avatar yang keluar dari header
              const SizedBox(height: 40),
              
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Judul
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Center(
                            child: Text(
                              titles[step].split('\n')[0],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1B263B),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Center(
                            child: Text(
                              titles[step].split('\n')[1],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Progress bar dan teks
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            children: [
                              Text(
                                stepText[step],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "${(progress[step] * 100).toInt()}% Selesai",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: progress[step],
                              minHeight: 8,
                              color: const Color(0xFF1B263B),
                              backgroundColor: Colors.grey.shade200,
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Form fields
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              // STEP 1: Informasi Dasar
                              if (step == 0) ...[
                                buildTextField(hint: 'Nama Lengkap'),
                                const SizedBox(height: 16),
                                buildTextField(hint: 'NISN'),
                                const SizedBox(height: 16),
                                buildTextField(hint: 'Kelas'),
                                const SizedBox(height: 16),
                                buildTextField(hint: 'Tanggal Lahir'),
                              ],

                              // STEP 2: Rincian Lanjutan
                              if (step == 1) ...[
                                buildTextField(hint: 'Nomor WA Aktif'),
                                const SizedBox(height: 16),
                                buildTextField(hint: 'Email Aktif'),
                                const SizedBox(height: 16),
                                buildTextField(hint: 'Alamat Lengkap'),
                                const SizedBox(height: 16),
                                buildTextField(hint: 'Nama Wali Murid'),
                              ],

                              // STEP 3: Spesialisasi (atau Minat)
                              if (step == 2) ...[
                                buildTextField(hint: 'Minat Belajar'),
                                const SizedBox(height: 16),
                                buildTextField(hint: 'Cita-cita'),
                                const SizedBox(height: 16),
                                buildTextField(hint: 'Hobi'),
                              ],

                              const SizedBox(height: 32),

                              // Tombol Aksi
                              ElevatedButton(
                                onPressed: controller.nextStep,
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(52),
                                  backgroundColor: const Color(0xFF1B263B),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 0,
                                ),
                                child: Text(
                                  step < 2 ? "Selanjutnya" : "Simpan",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              
                              TextButton(
                                onPressed: controller.skip,
                                style: TextButton.styleFrom(
                                  minimumSize: const Size.fromHeight(36),
                                  foregroundColor: Colors.grey[600],
                                ),
                                child: const Text(
                                  "Lewati",
                                  style: TextStyle(
                                    fontSize: 14,
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
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget buildTextField({required String hint}) {
    IconData getIconForHint(String hint) {
      switch (hint.toLowerCase()) {
        case 'nama lengkap':
          return Icons.person;
        case 'nisn':
          return Icons.badge;
        case 'kelas':
          return Icons.class_;
        case 'tanggal lahir':
          return Icons.calendar_today;
        case 'nomor wa aktif':
          return Icons.phone;
        case 'email aktif':
          return Icons.email;
        case 'alamat lengkap':
          return Icons.home;
        case 'nama wali murid':
          return Icons.people;
        case 'minat belajar':
          return Icons.school;
        case 'cita-cita':
          return Icons.stars;
        case 'hobi':
          return Icons.sports_esports;
        default:
          return Icons.edit;
      }
    }

    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: 14,
        ),
        prefixIcon: Icon(
          getIconForHint(hint),
          color: Colors.grey[600],
          size: 20,
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF1B263B)),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
      ),
    );
  }
}