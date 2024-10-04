import fs from 'fs';
import { parse } from 'csv-parse';

// Leer el archivo CSV
const content = fs.readFileSync('./fisi_2020.csv', 'utf-8');

// Analizar el contenido del CSV
parse(content, {
    delimiter: ',',
    columns: true
}, (err, records) => {
    if (err) {
        console.error('Error al analizar el CSV:', err);
        return;
    }
    // Manejar los datos analizados
    console.log(records);
});