import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreatePokemonDto } from './dto/create-pokemon.dto';
import { UpdatePokemonDto } from './dto/update-pokemon.dto';
import { Pokemon } from './entities/pokemon.entity';

@Injectable()
export class PokemonService {
  constructor(private prisma: PrismaService) {}

  create(createPokemonDto: CreatePokemonDto) {
    return this.prisma.pokemon.create({ data: createPokemonDto });
  }

  findAll(): Promise<Pokemon[]> {
    return this.prisma.pokemon.findMany();
  }

  findOne(id: number): Promise<Pokemon | null> {
    return this.prisma.pokemon.findUnique({ where: { id } });
  }

  update(id: number, updatePokemonDto: UpdatePokemonDto) {
    return this.prisma.pokemon.update({
      where: { id },
      data: updatePokemonDto,
    });
  }

  remove(id: number) {
    return this.prisma.pokemon.delete({ where: { id } });
  }
}
