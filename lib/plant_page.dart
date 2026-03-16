import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'plant_form_page.dart';
import 'login_page.dart';

class PlantPage extends StatefulWidget {
  const PlantPage({super.key});

  @override
  State<PlantPage> createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {
  final supabase = Supabase.instance.client;
  List plants = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() => isLoading = true);
    try {
      final data = await supabase.from('plants').select().order('name');
      setState(() {
        plants = data;
      });
    } catch (e) {
      print("Error: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  bool isScheduledToday(String schedule) {

    String today = DateFormat('E', 'id_ID').format(DateTime.now());
    return schedule.contains(today);
  }

  void _confirmDelete(int id) {
    Get.defaultDialog(
      title: "Hapus?",
      middleText: "Yakin ingin menghapus tanaman ini dari koleksi?",
      textCancel: "Batal",
      textConfirm: "Ya, Hapus",
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () async {
        await supabase.from('plants').delete().match({'id': id});
        Get.back();
        fetchData();
        Get.snackbar("Terhapus", "Data tanaman berhasil dihapus");
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    List todoToday = plants.where((p) => isScheduledToday(p['schedule'] ?? "")).toList();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("PlantCare Pro 🌿"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.grass), text: "Koleksi"),
              Tab(icon: Icon(Icons.water_drop), text: "Tugas Siram"),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.brightness_6),
              onPressed: () => Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark),
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await supabase.auth.signOut();
                Get.offAll(() => const LoginPage());
              },
            ),
          ],
        ),
        body: TabBarView(
          children: [

            isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: plants.length,
              itemBuilder: (context, index) {
                final plant = plants[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(Icons.local_florist, color: Colors.white),
                    ),
                    title: Text(plant['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("Spesies: ${plant['species']}\nJadwal: ${plant['schedule']}"),
                    isThreeLine: true,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () async {
                            await Get.to(() => PlantFormPage(plant: plant));
                            fetchData();
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _confirmDelete(plant['id']),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),


            ListView(
              padding: const EdgeInsets.all(15),
              children: [
                const Text(
                  "Tugas Siram Hari Ini:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(DateTime.now()),
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const Divider(height: 30),
                if (todoToday.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(Icons.check_circle_outline, size: 60, color: Colors.grey),
                          SizedBox(height: 10),
                          Text("Semua beres! Tidak ada jadwal siram hari ini."),
                        ],
                      ),
                    ),
                  )
                else
                  ...todoToday.map((p) => Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.water_drop, color: Colors.white, size: 20),
                      ),
                      title: Text(
                        "Siram ${p['name']}",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text("Jadwal rutin: ${p['schedule']}"),
                    ),
                  )).toList(),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Get.to(() => const PlantFormPage());
            fetchData();
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}