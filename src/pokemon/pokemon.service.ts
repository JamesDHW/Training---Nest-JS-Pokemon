import { Injectable } from '@nestjs/common';
import { pokemon } from './pokemon.json';
import { Pokemon } from './pokemon.types';

@Injectable()
export class PokemonService {
  getAllPokemon(): Pokemon[] {
    return pokemon;
  }
}
