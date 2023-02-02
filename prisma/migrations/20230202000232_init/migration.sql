-- CreateTable
CREATE TABLE "Pokemon" (
    "id" INT8 NOT NULL DEFAULT unique_rowid(),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "level" INT4 NOT NULL DEFAULT 1,

    CONSTRAINT "Pokemon_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PokemonSpecies" (
    "id" INT8 NOT NULL DEFAULT unique_rowid(),
    "name" STRING NOT NULL,
    "url" STRING NOT NULL,

    CONSTRAINT "PokemonSpecies_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PokemonType" (
    "id" INT8 NOT NULL DEFAULT unique_rowid(),
    "name" STRING NOT NULL,

    CONSTRAINT "PokemonType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_PokemonSpeciesToPokemonType" (
    "A" INT8 NOT NULL,
    "B" INT8 NOT NULL
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
