$(document).ready(function() {
  $('form.random_pokemon').on('ajax:success', randomizeHandler.prependPokemon);
  $('form.sort-pokemon').submit(sortPokemon);
  modalEventListeners();
});

function modalEventListeners(){
	$('.pokedex-img').click(pokedexEntryModal.displayModal)
	$('.modal-close').click(pokedexEntryModal.closeModal)
}