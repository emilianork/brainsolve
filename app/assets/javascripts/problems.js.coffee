# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

arpovado = false;

Campo =
  
  campoValido: (relleno) ->
    relleno != "" 
    
  correoValido: (correo) ->
    expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
    expr.test(correo)
    
  telefonoValido: (numero) ->
    expr = /^([0-9])+$/
    expr.test(numero)

jQuery ->
  $("#problem_title").blur ->
    if Campo.campoValido(@value)
      $(".titleerror").css visibility: 'hidden'
    else
      $(".titleerror").css visibility: 'visible'
      
  $("#problem_description").blur ->
    if Campo.campoValido(@value)
      $(".descriperror").css visibility: 'hidden'
    else
      $(".descriperror").css visibility: 'visible'
      
  $("#problem_telephone").blur ->
    if Campo.telefonoValido(@value)
      $(".telerror").css visibility: 'hidden'
    else
      $(".telerror").css visibility: 'visible'
      
  $("#problem_contact").blur ->
    if Campo.correoValido(@value)
      $("#emailerror").css visibility: 'hidden'
    else
      $("#emailerror").css visibility: 'visible'
