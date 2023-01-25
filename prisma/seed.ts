// prisma/seed.ts

import { PrismaClient } from '@prisma/client';

// initialize Prisma Client
const prisma = new PrismaClient();

async function main() {
  // create the starter pokemon
  const bulbasaur = await prisma.pokemon.upsert({
    where: { name: 'Bulbasaur' },
    update: {},
    create: {
      name: 'Bulbasaur',
      url: 'https://pokeapi.co/api/v2/pokemon/1/',
    },
  });

  const charmander = await prisma.pokemon.upsert({
    where: { name: 'Charmander' },
    update: {},
    create: {
      name: 'Charmander',
      url: 'https://pokeapi.co/api/v2/pokemon/4/',
    },
  });

  const squirtle = await prisma.pokemon.upsert({
    where: { name: 'Squirtle' },
    update: {},
    create: {
      name: 'Squirtle',
      url: 'https://pokeapi.co/api/v2/pokemon/7/',
    },
  });

  console.log({ charmander, bulbasaur, squirtle });
}

// execute the main function
main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    // close Prisma Client at the end
    await prisma.$disconnect();
  });
