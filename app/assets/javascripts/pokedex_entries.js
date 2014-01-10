var randomizeHandler = {

  prependPokemon: function(e, newPokemon) {
    $('#all-entries').prepend(newPokemon.pokemon_entry);
    modalEventListeners();
  }
};

function sortPokemon(e){
	e.preventDefault();
	$("#all-entries>div").tsort({attr:"id"});
}
