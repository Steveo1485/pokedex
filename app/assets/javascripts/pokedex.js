// The jQuery Way
// var RandomizeHandler = {

//   init: function(){
//     $('form.random_pokemon').click(RandomizeHandler.randomPokemon)
//   },

//   randomPokemon: function(e){
//     e.preventDefault();
//     var $newPokemonButton = $(this);
//     $.ajax({
//       url: $newPokemonButton.prop('action'),
//       type: $newPokemonButton.prop('method')
//     }).done(function(newPokemon) {
//       RandomizeHandler.prependPokemon(newPokemon)
//     }).fail(function() {
//     })
//   },

//   prependPokemon: function(newPokemon) {
//     $('#all-entries').prepend(newPokemon.pokemon_entry)
//   }
// };



// $(document).ready(function() {
//   RandomizeHandler.init()
// })

// The Rails Way
var randomizeHandler = {

  prependPokemon: function(e, newPokemon) {
    $('#all-entries').prepend(newPokemon.pokemon_entry);
  }
};

$(document).ready(function() {
  $('form.random_pokemon').on('ajax:success', randomizeHandler.prependPokemon);
});
