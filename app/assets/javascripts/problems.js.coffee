# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

arpovado = false;

Campo =
  
  campoValido: (relleno) ->
    if relleno != "" then true else false 

jQuery ->
  $("textarea").blur ->
    if Campo.campoValido(@value)
      $("#error").css visibility: 'hidden'
    else
      $("#error").css visibility: 'visible'
