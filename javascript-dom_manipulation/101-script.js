
document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('btn_translate').addEventListener('click', function () {
        const languageCode = document.getElementById('language_code').value;
        const url = `https://hellosalut.stefanbohacek.dev/?lang=${languageCode}`;

        fetch(url)
            .then(response => response.json())
            .then(data => {
                document.getElementById('hello').innerText = data.hello;
            })
            .catch(error => console.error('Error:', error));
    });
});