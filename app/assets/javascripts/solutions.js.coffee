# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


Campo =
  
  campoValido: (relleno) ->
    relleno != "" 
    
  correoValido: (correo) ->
    expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/
    expr.test(correo)
    
  telefonoValido: (numero) ->
    expr = /(^([0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])$)|(^$)|(^([0-9][0-9]-[0-9][0-9]-[0-9][0-9]-[0-9][0-9])$)/
    expr.test(numero)
    
  numeroValido: (numero) ->
    expr = /(^([0-9]+)$)|(^$)/
    expr.test(numero)

ready = ->
  $("#solution_text").blur ->
    if Campo.campoValido(@value)
      $("#texterror").css visibility: 'hidden'
    else
      $("#texterror").css visibility: 'visible'
      
  $("#solution_estimate").blur ->
    if Campo.numeroValido(@value)
      $("#estimateerror").css visibility: 'hidden'
    else
      $("#estimateerror").css visibility: 'visible'
      
  $("#solution_email").blur ->
    if Campo.correoValido(@value)
      $("#emailerror").css visibility: 'hidden'
      $('#email_err > div').removeClass 'field_with_errors'
      $('#email_err > div').addClass 'field'
    else
      $("#emailerror").css visibility: 'visible'
      
  $("#solution_telephone").blur ->
    if Campo.telefonoValido(@value)
      $("#telerror").css visibility: 'hidden'
      $('#telefono5 > div').removeClass 'field_with_errors'
      $('#telefono5 > div').addClass 'field'
    else
      $("#telerror").css visibility: 'visible'
      
  $("#solution_company_telephone").blur ->
    if Campo.telefonoValido(@value)
      $("#company_telephoneerror").css visibility: 'hidden'
      $('#telcomp > div').removeClass 'field_with_errors'
      $('#telcomp > div').addClass 'field'
    else
      $("#company_telephoneerror").css visibility: 'visible'     
      

$(document).ready(ready)
$(document).on('page:load', ready)
