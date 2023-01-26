import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { PokemonService } from './pokemon.service';
import { CreatePokemonDto } from './dto/create-pokemon.dto';
import { UpdatePokemonDto } from './dto/update-pokemon.dto';
import { ApiCreatedResponse, ApiOkResponse, ApiTags } from '@nestjs/swagger';
import { Pokemon } from './entities/pokemon.entity';

@Controller('pokemon')
@ApiTags('pokemon')
export class PokemonController {
  constructor(private readonly pokemonService: PokemonService) {}

  @Post()
  @ApiCreatedResponse({ type: Pokemon })
  create(@Body() createPokemonDto: CreatePokemonDto) {
    return this.pokemonService.create(createPokemonDto);
  }

  @Get()
  @ApiOkResponse({ type: Pokemon, isArray: true })
  findAll() {
    return this.pokemonService.findAll();
  }

  @Get(':id')
  @ApiOkResponse({ type: Pokemon })
  findOne(@Param('id') id: string) {
    return this.pokemonService.findOne(+id);
  }

  @Patch(':id')
  @ApiOkResponse({ type: Pokemon })
  update(@Param('id') id: string, @Body() updatePokemonDto: UpdatePokemonDto) {
    return this.pokemonService.update(+id, updatePokemonDto);
  }

  @Delete(':id')
  @ApiOkResponse({ type: Pokemon })
  remove(@Param('id') id: string) {
    return this.pokemonService.remove(+id);
  }
}
