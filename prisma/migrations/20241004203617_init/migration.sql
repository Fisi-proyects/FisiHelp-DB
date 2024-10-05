/*
  Warnings:

  - A unique constraint covering the columns `[codigo]` on the table `Alumno` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `codigo` to the `Alumno` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Alumno" ADD COLUMN     "codigo" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Alumno_codigo_key" ON "Alumno"("codigo");
