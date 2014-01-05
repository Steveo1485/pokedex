var randomizeHandler = {

  prependPokemon: function(e, newPokemon) {
    $('#all-entries').prepend(newPokemon.pokemon_entry);
  }
};

function sortPokemon(e){
	e.preventDefault();
	$("#all-entries>div").tsort({attr:"id"});
}

$(document).ready(function() {
  $('form.random_pokemon').on('ajax:success', randomizeHandler.prependPokemon);
  $('form.sort-pokemon').submit(sortPokemon);
});
