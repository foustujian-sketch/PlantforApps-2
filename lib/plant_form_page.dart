import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PlantFormPage extends StatefulWidget {
  final Map? plant;
  const PlantFormPage({super.key, this.plant});

  @override
  State<PlantFormPage> createState() => _PlantFormPageState();
}

class _PlantFormPageState extends State<PlantFormPage> {
  final supabase = Supabase.instance.client;
  final nameCtrl = TextEditingController();
  final speciesCtrl = TextEditingController();

  List<String> days = ["Sen", "Sel", "Rab", "Kam", "Jum", "Sab", "Min"];
  List<String> selectedDays = [];
  int timesPerDay = 1;

  @override
  void initState() {
    super.initState();

    if (widget.plant != null) {
      nameCtrl.text = widget.plant!['name'] ?? "";
      speciesCtrl.text = widget.plant!['species'] ?? "";

      String oldSchedule = widget.plant!['schedule'] ?? "";

      for (var day in days) {
        if (oldSchedule.contains(day)) {
          selectedDays.add(day);
        }
      }


      RegExp regExp = RegExp(r'(\d+)');
      var match = regExp.firstMatch(oldSchedule);
      if (match != null) {
        timesPerDay = int.parse(match.group(0)!);
      }
    }
  }

  Future<void> savePlant() async {
    if (nameCtrl.text.isEmpty || selectedDays.isEmpty) {
      Get.snackbar("Peringatan", "Nama dan Hari harus diisi!");
      return;
    }

    String scheduleInfo = "${selectedDays.join(", ")} ($timesPerDay kali sehari)";
    final data = {
      'name': nameCtrl.text,
      'species': speciesCtrl.text,
      'schedule': scheduleInfo,
      'user_id': supabase.auth.currentUser?.id,
    };

    try {
      if (widget.plant == null) {
        await supabase.from('plants').insert(data);
      } else {
        await supabase.from('plants').update(data).match({'id': widget.plant!['id']});
      }
      Get.back();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.plant == null ? "Tambah Tanaman" : "Edit Tanaman")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: "Nama Tanaman", border: OutlineInputBorder())),
            const SizedBox(height: 15),
            TextField(controller: speciesCtrl, decoration: const InputDecoration(labelText: "Spesies", border: OutlineInputBorder())),
            const SizedBox(height: 25),
            const Text("Pilih Hari Penyiraman:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: days.map((day) {
                final isSelected = selectedDays.contains(day);
                return FilterChip(
                  label: Text(day),
                  selected: isSelected,
                  onSelected: (bool value) {
                    setState(() {
                      if (value) { selectedDays.add(day); }
                      else { selectedDays.remove(day); }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Text("Frekuensi: $timesPerDay kali sehari", style: const TextStyle(fontWeight: FontWeight.bold)),
            Slider(
              value: timesPerDay.toDouble(),
              min: 1, max: 5, divisions: 4,
              label: timesPerDay.toString(),
              onChanged: (val) => setState(() => timesPerDay = val.toInt()),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  onPressed: savePlant,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                  child: const Text("Simpan Perubahan")
              ),
            ),
          ],
        ),
      ),
    );
  }
}