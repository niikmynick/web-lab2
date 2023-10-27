const path = require('path');

module.exports = {
    entry: "./main.js", // Путь к директории с вашими JavaScript-файлами
    output: {
        filename: 'bundle.js', // Имя собранного файла
        path: path.resolve(__dirname, 'src/main/webapp/dist'), // Директория для собранного файла
    },
    mode: "none",
};