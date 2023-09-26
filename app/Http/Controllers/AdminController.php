<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AdminController extends Controller
{
    //Fungsi ini digunakan untuk menampilkan formulir untuk menambahkan data admin baru.
    //Ketika pengguna mengakses rute yang sesuai, metode ini akan memuat tampilan 'admin.add' yang berisi formulir tambah data admin.
    public function create()
    {
        return view('admin.add');
    }

    //Fungsi ini digunakan untuk menyimpan data admin yang baru dimasukkan melalui formulir.
    //Sebelum menyimpan, fungsi melakukan validasi data yang diterima dari permintaan HTTP menggunakan metode validate(). Validasi ini memastikan bahwa data yang diterima sesuai dengan aturan yang diberikan, seperti tidak boleh kosong.
    //Jika validasi berhasil, fungsi ini akan memasukkan data admin baru ke dalam tabel 'admin' menggunakan SQL INSERT.
    //Kemudian, pengguna akan diarahkan kembali ke halaman indeks admin ('admin.index') dengan pesan sukses.
    public function store(Request $request)
    {
        $request->validate([
            'id_admin' => 'required',
            'nama_admin' => 'required',
            'alamat' => 'required',
            'username' => 'required',
            'password' => 'required',
        ]);
        DB::insert(
            'INSERT INTO admin(id_admin,nama_admin, alamat, username, password) VALUES (:id_admin, :nama_admin, :alamat, :username, :password)',
            [
                'id_admin' => $request->id_admin,
                'nama_admin' => $request->nama_admin,
                'alamat' => $request->alamat,
                'username' => $request->username,
                'password' => $request->password,
            ]
        );
        return redirect()->route('admin.index')->with('success', 'Data Admin berhasil disimpan');
    }

    //Fungsi ini digunakan untuk menampilkan semua data admin yang ada dalam tabel 'admin'.
    //Fungsi ini mengambil data admin dari tabel 'admin' menggunakan SQL SELECT dan kemudian mengirimkan data ini ke tampilan 'admin.index' untuk ditampilkan kepada pengguna.
    public function index()
    {
        $datas = DB::select('select * from admin');
        return view('admin.index')->with('datas', $datas);
    }

    //Fungsi ini digunakan untuk menampilkan formulir pengeditan data admin yang telah ada.
    //Parameter $id adalah identifikasi unik admin yang akan diedit.
    //Fungsi ini akan mengambil data admin dengan ID yang sesuai dari tabel 'admin' menggunakan SQL SELECT, dan kemudian menampilkan formulir pengeditan dengan data yang diperoleh.
    public function edit($id)
    {
        $data = DB::table('admin')->where('id_admin', $id)->first();
        return view('admin.edit')->with('data', $data);
    }

    //Fungsi ini digunakan untuk memperbarui data admin yang telah diedit melalui formulir.
    //Mirip dengan fungsi store(), ini juga melakukan validasi data yang diterima dari permintaan HTTP.
    //Jika validasi berhasil, fungsi ini akan mengupdate data admin yang sesuai di dalam tabel 'admin' menggunakan SQL UPDATE.
    //Setelah perubahan berhasil dilakukan, pengguna akan diarahkan kembali ke halaman indeks admin dengan pesan sukses.
    public function update($id, Request $request)
    {
        $request->validate([
            'id_admin' => 'required',
            'nama_admin' => 'required',
            'alamat' => 'required',
            'username' => 'required',
            'password' => 'required',
        ]);

        DB::update(
            'UPDATE admin SET id_admin = :id_admin, nama_admin = :nama_admin, alamat = :alamat, username = :username, password = :password WHERE id_admin = :id',
            [
                'id' => $id,
                'id_admin' => $request->id_admin,
                'nama_admin' => $request->nama_admin,
                'alamat' => $request->alamat,
                'username' => $request->username,
                'password' => $request->password,
            ]
        );

        return redirect()->route('admin.index')->with('success', 'Data Admin berhasil diubah');
    }

    //Fungsi ini digunakan untuk menghapus data admin dari tabel 'admin' berdasarkan ID yang diberikan.
    //Fungsi ini menggunakan SQL DELETE untuk menghapus data yang sesuai.
    //Setelah penghapusan berhasil dilakukan, pengguna akan diarahkan kembali ke halaman indeks admin dengan pesan sukses.
    public function delete($id)
    {
        DB::delete('DELETE FROM admin WHERE id_admin = :id_admin', ['id_admin' => $id]);
        return redirect()->route('admin.index')->with('success', 'Data Admin berhasil dihapus');
    }
}
