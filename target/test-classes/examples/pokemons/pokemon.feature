Feature: Pokemones
  Background:
    * url 'https://pokeapi.co/api/v2/pokemon'

  Scenario: Get Pokemon
    Given path '/charmander/'
    When method get
    Then status 200

  Scenario: Get evolutions of the pokemon
    Given path '/charmander/'
    When method get
    Then status 200
    And def speciesUrl = response.species.url

    Given url speciesUrl
    When method get
    And def evolutionChainUrl = response.evolution_chain.url

    Given url evolutionChainUrl
    When method get
    Then status 200
    And def normalpokemon = response.chain.species.name
    And def firstEvolution = response.chain.evolves_to[0].species.name
    And def SecondEvolution = response.chain.evolves_to[0].evolves_to[0].species.name

    And print 'namedPokemon:', normalpokemon
    And print 'Primera evolucion:', firstEvolution
    And print 'Segunda evolucion:', SecondEvolution