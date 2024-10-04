-- CreateTable
CREATE TABLE "Alumno" (
    "id" TEXT NOT NULL,
    "nombre" TEXT NOT NULL,
    "apellido_pat" TEXT NOT NULL,
    "apellido_mat" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "DNI" TEXT NOT NULL,
    "ponderado" DOUBLE PRECISION NOT NULL,
    "observado" BOOLEAN NOT NULL,

    CONSTRAINT "Alumno_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Curso" (
    "id" TEXT NOT NULL,
    "codigo" TEXT NOT NULL,
    "creditos" INTEGER NOT NULL,
    "cupos" INTEGER NOT NULL,
    "matriculados" INTEGER NOT NULL,
    "aprobados" INTEGER NOT NULL,
    "desaprobados" INTEGER NOT NULL,
    "id_salon" INTEGER NOT NULL,
    "prerequisito" TEXT NOT NULL,
    "curso_posterior" TEXT NOT NULL,

    CONSTRAINT "Curso_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "espacio_servicio" (
    "id" TEXT NOT NULL,
    "nombre" TEXT NOT NULL,
    "capacidad" INTEGER NOT NULL,

    CONSTRAINT "espacio_servicio_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "reserva" (
    "id" TEXT NOT NULL,
    "id_espacio_servicio" TEXT NOT NULL,
    "id_alumno" TEXT NOT NULL,
    "hora_inicio" TIMESTAMP(3) NOT NULL,
    "hora_fin" TIMESTAMP(3) NOT NULL,
    "estado" TEXT NOT NULL,
    "descripcion" TEXT NOT NULL,

    CONSTRAINT "reserva_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "aparato" (
    "id" TEXT NOT NULL,
    "nombre" TEXT NOT NULL,
    "descripcion" TEXT NOT NULL,
    "id_espacio_servicio" TEXT NOT NULL,

    CONSTRAINT "aparato_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "worker" (
    "id" TEXT NOT NULL,
    "nombre" TEXT NOT NULL,
    "apellido" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "DNI" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "cargo" TEXT NOT NULL,

    CONSTRAINT "worker_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Alumno_DNI_key" ON "Alumno"("DNI");

-- CreateIndex
CREATE UNIQUE INDEX "Curso_codigo_key" ON "Curso"("codigo");

-- CreateIndex
CREATE UNIQUE INDEX "worker_DNI_key" ON "worker"("DNI");

-- AddForeignKey
ALTER TABLE "reserva" ADD CONSTRAINT "reserva_id_alumno_fkey" FOREIGN KEY ("id_alumno") REFERENCES "Alumno"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reserva" ADD CONSTRAINT "reserva_id_espacio_servicio_fkey" FOREIGN KEY ("id_espacio_servicio") REFERENCES "espacio_servicio"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "aparato" ADD CONSTRAINT "aparato_id_espacio_servicio_fkey" FOREIGN KEY ("id_espacio_servicio") REFERENCES "espacio_servicio"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
