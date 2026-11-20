import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    String nama = '';
    String nik = '';
    String email = '';
    String password = '';

    String? jenisKelamin = 'Laki-laki';

    bool festival = false;
    bool vip = false;
    bool vvip = false;
    bool tamu = false;

    String? jumlahTiket;

    bool setuju = false;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
              child: Center(
                child: Container(
                  width: 1280,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade50,
                    border: Border.all(color: Colors.indigo, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Pembelian Tiket',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                              ),
                              ),
                          const SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Nama Lengkap',
                            hintText: 'Masukan Nama Lengkap',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onChanged: (value) {
                            nama = value;
                          },
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'nama wajib di isi';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'NIK',
                            hintText: 'Masukan NIK 16 digit angka',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            nik = value;
                          },
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'NIK wajib di isi';
                            }
                            if (int.tryParse(value.trim()) == null) {
                              return 'NIK harus angka';
                            }
                            if (value.trim().length < 16) {
                              return 'NIK harus 16 digit';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            hintText: 'nama@email.com',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            email = value;
                          },
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'email wajib di isi';
                            }
                            if (!value.contains('@') || !value.contains('.')) {
                              return 'format email tidak valid';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          initialValue: password,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText: 'Masukan Password',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.visibility),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            password = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'password wajib di isi';
                            }
                            if (value.length < 8) {
                              return 'password minimal 8 karakter';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        RadioListTile<String>(
                          title: const Text('Laki-laki'),
                          value: 'Laki-laki',
                          groupValue: jenisKelamin,
                          onChanged: (value) {
                            setState(() {
                              jenisKelamin = value;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text('Perempuan'),
                          value: 'Perempuan',
                          groupValue: jenisKelamin,
                          onChanged: (value) {
                            setState(() {
                              jenisKelamin = value;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('Festival'),
                          value: festival,
                          onChanged: (value) {
                            setState(() {
                              festival = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('VIP'),
                          value: vip,
                          onChanged: (value) {
                            setState(() {
                              vip = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('VVIP'),
                          value: vvip,
                          onChanged: (value) {
                            setState(() {
                              vvip = value!;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('Tamu'),
                          value: tamu,
                          onChanged: (value) {
                            setState(() {
                              tamu = value!;
                            });
                          },
                        ),
                        const SizedBox(height: 12),
                        DropdownButtonFormField<String>(
                          value: jumlahTiket,
                          decoration: const InputDecoration(
                            labelText: 'Jumlah Pembelian Tiket',
                            border: OutlineInputBorder(),
                          ),
                          hint: const Text('Pilih jumlah pembelian tiket'),
                          items: const [
                            DropdownMenuItem(value: '1', child: Text('1')),
                            DropdownMenuItem(value: '2', child: Text('2')),
                            DropdownMenuItem(value: '3', child: Text('3')),
                            DropdownMenuItem(value: '4', child: Text('4')),
                            DropdownMenuItem(value: '5', child: Text('5')),
                          ],
                          onChanged: (value) {
                            setState(() {
                              jumlahTiket = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'jumlah pembelian tiket wajib dipilih';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        CheckboxListTile(
                          title: const Text('Saya menyetujui syarat dan ketentuan'),
                          value: setuju,
                          onChanged: (value) {
                            setState(() {
                              setuju = value!;
                            });
                          },
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              List<String> kategori = [];
                              if (festival) kategori.add('Festival');
                              if (vip) kategori.add('VIP');
                              if (vvip) kategori.add('VVIP');
                              if (tamu) kategori.add('Tamu');

                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Ringkasan Pembelian Tiket'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Nama Lengkap: $nama'),
                                        Text('NIK: $nik'),
                                        Text('Email: $email'),
                                        Text('Jenis Kelamin: ${jenisKelamin ?? ''}'),
                                        Text('Kategori Tiket: ${kategori.join(', ')}'),
                                        Text('Jumlah Pembelian Tiket: ${jumlahTiket ?? ''}'),
                                        Text('Setuju S&K: ${setuju ? 'Ya' : 'Tidak'}'),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Tutup'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: const Text('Simpan'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}