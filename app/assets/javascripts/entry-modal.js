$(document).ready(function() {
  $('.pokedex-img').click(pokedexEntryModal.displayModal)
});

var pokedexEntryModal = {

  displayModal: function() {
  	var name = this.alt.toUpperCase()
	alert(name)
  }
};