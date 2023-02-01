/*
  Warnings:

  - You are about to drop the column `name` on the `Pokemon` table. All the data in the column will be lost.
  - You are about to drop the column `url` on the `Pokemon` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "Pokemon_name_key";

-- DropIndex
DROP INDEX "Pokemon_url_key";

-- AlterTable
ALTER TABLE "Pokemon" DROP COLUMN "name",
DROP COLUMN "url",
ADD COLUMN     "level" INTEGER NOT NULL DEFAULT 1;

-- CreateTable
CREATE TABLE "PokemonSpecies" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "url" TEXT NOT NULL,

    CONSTRAINT "PokemonSpecies_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PokemonType" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "PokemonType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_PokemonSpeciesToPokemonType" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "PokemonSpecies_name_key" ON "PokemonSpecies"("name");

-- CreateIndex
CREATE UNIQUE INDEX "PokemonSpecies_url_key" ON "PokemonSpecies"("url");

-- CreateIndex
CREATE UNIQUE INDEX "PokemonType_name_key" ON "PokemonType"("name");

-- CreateIndex
CREATE UNIQUE INDEX "_PokemonSpeciesToPokemonType_AB_unique" ON "_PokemonSpeciesToPokemonType"("A", "B");

-- CreateIndex
CREATE INDEX "_PokemonSpeciesToPokemonType_B_index" ON "_PokemonSpeciesToPokemonType"("B");

-- AddForeignKey
ALTER TABLE "Pokemon" ADD CONSTRAINT "Pokemon_id_fkey" FOREIGN KEY ("id") REFERENCES "PokemonSpecies"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PokemonType" ADD CONSTRAINT "PokemonType_name_fkey" FOREIGN KEY ("name") REFERENCES "PokemonType"("name") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PokemonSpeciesToPokemonType" ADD CONSTRAINT "_PokemonSpeciesToPokemonType_A_fkey" FOREIGN KEY ("A") REFERENCES "PokemonSpecies"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PokemonSpeciesToPokemonType" ADD CONSTRAINT "_PokemonSpeciesToPokemonType_B_fkey" FOREIGN KEY ("B") REFERENCES "PokemonType"("id") ON DELETE CASCADE ON UPDATE CASCADE;
