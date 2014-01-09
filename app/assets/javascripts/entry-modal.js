$(document).ready(function() {
  $('.pokedex-img').click(pokedexEntryModal.displayModal)
});

var pokedexEntryModal = {

  displayModal: function() {
    console.log("you clicked me")
  }
};