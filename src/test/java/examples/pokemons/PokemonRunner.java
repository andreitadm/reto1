package examples.pokemons;

import com.intuit.karate.junit5.Karate;

public class PokemonRunner {
    @Karate.Test
    Karate getPokemon(){
        return Karate.run("pokemon").relativeTo(getClass());
    }
}
