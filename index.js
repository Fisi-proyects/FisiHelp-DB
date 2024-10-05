import fs from 'fs';
import { parse } from 'csv-parse';
import { PrismaClient } from '@prisma/client';

// Leer el archivo CSV
const prisma = new PrismaClient;
const content = fs.readFileSync('./fisi_2020.csv', 'utf-8');

async function fillDB(codigo, nombre, apellido_pat, apellido_mat, email, dni) {
    const user = await prisma.alumno.create({
        data: {
            codigo: parseInt(codigo),
            nombre: nombre,
            apellido_pat: apellido_pat,
            apellido_mat: apellido_mat,
            email: email,
            DNI: dni,
            ponderado: 0.0,
            observado: false,
            password: ""
        }
    });
}

// Analizar el contenido del CSV
parse(content, {
    delimiter: ',',
    columns: true
}, (err, records) => {
    if (err) {
        console.error('Error al analizar el CSV:', err);
        return;
    }
    //console.log(records)
    const i = process.argv[2]-1;

    let [apellidos, nombres] = records[i].nombre.split(', ').map(item => item.trim())
    let [apellido_paterno, apellido_materno] = apellidos.split(' ').map(item => item.trim())
    console.log(nombres)
    console.log({apellido_paterno, apellido_materno})
    fillDB(records[i].codigo,nombres,apellido_paterno,apellido_materno,records[i].correo,records[i].documento )
    // Manejar los datos analizados
    //console.log(records);
    //|records.forEach((record) => {
        //console.log(record.nombre);
    //    let [apellidos, nombres] = record.nombre.split(', ').map(item => item.trim())
        //console.log({apellidos, nombres})
    //    let [apellido_paterno, apellido_materno] = apellidos.split(' ').map(item => item.trim())
        //console.log({apellido_paterno, apellido_materno})
        
        //fillDB(record.codigo,nombres,apellido_paterno,apellido_materno,record.correo,record.documento )
    //});
    //console.log(records[0].codigo,records[0].documento, records[0].correo, records[0].documento);
});

console.log('Finalizado');
