/*
  Warnings:

  - Added the required column `password` to the `Alumno` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Alumno" ADD COLUMN     "password" TEXT NOT NULL;
