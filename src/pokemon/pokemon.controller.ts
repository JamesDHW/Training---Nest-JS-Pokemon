import { Controller, Get } from '@nestjs/common';
import { PokemonService } from './pokemon.service';
import { Pokemon } from './pokemon.types';

@Controller('pokemon')
export class PokemonController {
  constructor(private readonly pokemonService: PokemonService) {}

  @Get()
  getAllPokemon(): Pokemon[] {
    return this.pokemonService.getAllPokemon();
  }
}
