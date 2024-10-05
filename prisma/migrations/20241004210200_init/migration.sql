/*
  Warnings:

  - The primary key for the `Alumno` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Alumno` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Curso` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Curso` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `espacio_servicio` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `espacio_servicio` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `reserva` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `reserva` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Changed the type of `id_espacio_servicio` on the `aparato` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `id_espacio_servicio` on the `reserva` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `id_alumno` on the `reserva` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "aparato" DROP CONSTRAINT "aparato_id_espacio_servicio_fkey";

-- DropForeignKey
ALTER TABLE "reserva" DROP CONSTRAINT "reserva_id_alumno_fkey";

-- DropForeignKey
ALTER TABLE "reserva" DROP CONSTRAINT "reserva_id_espacio_servicio_fkey";

-- AlterTable
ALTER TABLE "Alumno" DROP CONSTRAINT "Alumno_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "Alumno_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Curso" DROP CONSTRAINT "Curso_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "Curso_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "aparato" DROP COLUMN "id_espacio_servicio",
ADD COLUMN     "id_espacio_servicio" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "espacio_servicio" DROP CONSTRAINT "espacio_servicio_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "espacio_servicio_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "reserva" DROP CONSTRAINT "reserva_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
DROP COLUMN "id_espacio_servicio",
ADD COLUMN     "id_espacio_servicio" INTEGER NOT NULL,
DROP COLUMN "id_alumno",
ADD COLUMN     "id_alumno" INTEGER NOT NULL,
ADD CONSTRAINT "reserva_pkey" PRIMARY KEY ("id");

-- AddForeignKey
ALTER TABLE "reserva" ADD CONSTRAINT "reserva_id_alumno_fkey" FOREIGN KEY ("id_alumno") REFERENCES "Alumno"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reserva" ADD CONSTRAINT "reserva_id_espacio_servicio_fkey" FOREIGN KEY ("id_espacio_servicio") REFERENCES "espacio_servicio"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "aparato" ADD CONSTRAINT "aparato_id_espacio_servicio_fkey" FOREIGN KEY ("id_espacio_servicio") REFERENCES "espacio_servicio"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
