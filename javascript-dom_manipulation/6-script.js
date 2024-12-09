document.addEventListener('DOMContentLoaded', () => {
    fetch('https://swapi-api.hbtn.io/api/people/5/?format=json')
        .then(response => response.json())
        .then(data => {
            document.getElementById('character').textContent = data.name;
        })
        .catch(error => console.error('Error:', error));
});