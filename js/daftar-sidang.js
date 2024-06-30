document.addEventListener('DOMContentLoaded', function() {
    const skripsiForm = document.getElementById('skripsiForm');

    skripsiForm.addEventListener('submit', function(event) {
        event.preventDefault();

        const kartuBimbingan = document.getElementById('kartu-bimbingan').files[0];
        const kartuSeminar = document.getElementById('kartu-seminar').files[0];
        const buktiTurnitin = document.getElementById('bukti-turnitin').files[0];

        if (!kartuBimbingan || !kartuSeminar || !buktiTurnitin) {
            alert('Semua file harus diunggah.');
            return;
        }

        const formData = new FormData();
        formData.append('kartu-bimbingan', kartuBimbingan);
        formData.append('kartu-seminar', kartuSeminar);
        formData.append('bukti-turnitin', buktiTurnitin);

        // Simulasi pengiriman data ke server
        fetch('/submit', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Pengajuan sidang skripsi berhasil.');
                // Reset form setelah berhasil
                skripsiForm.reset();
            } else {
                alert('Terjadi kesalahan saat pengajuan. Coba lagi.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Terjadi kesalahan saat pengajuan. Coba lagi.');
        });
    });
});
