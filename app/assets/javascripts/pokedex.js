var RandomizeHandler = {

  init: function(){
    $('form.random_pokemon').click(RandomizeHandler.randomPokemon)
  },

  randomPokemon: function(e){
    e.preventDefault();
    var $newPokemonButton = $(this);
    $.ajax({
      url: $newPokemonButton.prop('action'),
      type: $newPokemonButton.prop('method')
    }).done(function(newPokemon) {
      RandomizeHandler.prependPokemon(newPokemon)
    }).fail(function() {
      console.log("failed!")
    })
  },

  prependPokemon: function(newPokemon) {
    $('#all-entries').prepend(newPokemon.pokemon_entry)
  }
};










$(document).ready(function() {
  RandomizeHandler.init()
})
