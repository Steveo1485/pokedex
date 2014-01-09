$(document).ready(function() {
  $('.pokedex-img').click(pokedexEntryModal.displayModal)
});

var pokedexEntryModal = {

  displayModal: function() {
  var pokemonName = this.alt.toUpperCase()
  $('.modal-name').text(pokemonName)
  $('.entry-modal').css("display","block")
  }
};