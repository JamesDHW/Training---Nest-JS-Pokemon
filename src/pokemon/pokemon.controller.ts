import { Controller, Get } from '@nestjs/common';

@Controller('pokemon')
export class PokemonController {
  @Get()
  getAllPokemon(): string {
    return '';
  }
}
