document.addEventListener('DOMContentLoaded', () => {
    const addItem = document.getElementById('add_item');
    const removeItem = document.getElementById('remove_item');
    const clearList = document.getElementById('clear_list');
    const myList = document.getElementById('my_list');

    addItem.addEventListener('click', () => {
        const newItem = document.createElement('li');
        newItem.textContent = 'Item';
        myList.appendChild(newItem);
    });

    removeItem.addEventListener('click', () => {
        if (myList.lastElementChild) {
            myList.removeChild(myList.lastElementChild);
        }
    });

    clearList.addEventListener('click', () => {
        myList.innerHTML = '';
    });
});