document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('skripsiForm');

    form.addEventListener('submit', function (event) {
        event.preventDefault();
        validateForm();
    });

    function validateForm() {
        const kartuBimbingan = document.getElementById('kartu-bimbingan').files[0];
        const kartuSeminar = document.getElementById('kartu-seminar').files[0];

        if (!kartuBimbingan) {
            alert('Harap unggah Kartu Bimbingan.');
            return;
        }

        if (!kartuSeminar) {
            alert('Harap unggah Kartu Persetujuan Seminar Proposal.');
            return;
        }

        // Proses pengiriman data
        submitForm(kartuBimbingan, kartuSeminar);
    }

    function submitForm(kartuBimbingan, kartuSeminar) {
        // Contoh pengiriman data dengan FormData
        const formData = new FormData();
        formData.append('kartu-bimbingan', kartuBimbingan);
        formData.append('kartu-seminar', kartuSeminar);

        fetch('/submit-seminar-proposal', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Pengajuan seminar proposal berhasil.');
                updateTable(data.seminarProposalStatus);
            } else {
                alert('Pengajuan seminar proposal gagal. Coba lagi.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Terjadi kesalahan. Coba lagi.');
        });
    }

    function updateTable(statusData) {
        const tableBody = document.querySelector('.table-container tbody');
        tableBody.innerHTML = '';

        statusData.forEach(item => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${item.judulSkripsi}</td>
                <td>${item.dosenPembimbing}</td>
                <td>${item.dosenPenguji}</td>
                <td>${item.status}</td>
                <td>${item.tanggalSeminar}</td>
                <td>${item.tempatSeminar}</td>
            `;
            tableBody.appendChild(row);
        });
    }
});
