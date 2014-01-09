$(document).ready(function() {
  $('.pokedex-img').click(pokedexEntryModal.displayModal)
  $('.modal-close').click(pokedexEntryModal.closeModal)
});

var pokedexEntryModal = {

  displayModal: function() {
  var pokemonName = this.alt.toUpperCase()
  $('.modal-name').text(pokemonName)
  $('.entry-modal').css("display","block")
  },

  closeModal: function() {
  $('.entry-modal').css("display","none")
  }
};