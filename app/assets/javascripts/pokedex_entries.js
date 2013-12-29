var randomizeHandler = {

  prependPokemon: function(e, newPokemon) {
    $('#all-entries').prepend(newPokemon.pokemon_entry);
  }
};

$(document).ready(function() {
  $('form.random_pokemon').on('ajax:success', randomizeHandler.prependPokemon);
});
