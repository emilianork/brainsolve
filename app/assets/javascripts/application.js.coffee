# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree 


lightBox =
	ocultaContenido: ->
		$(".sobrepuesto_negro").css display: 'none'
		$(".contenido_blanco").css display: 'none'
	muestraContenido: ->
		$(".sobrepuesto_negro").css display: 'block'
		$(".contenido_blanco").css display: 'block'
	hayNotificaciones: ->
		if lightBox.cuentaNotificaciones() == 0
			lightBox.ocultaContenido()
		else
			lightBox.muestraContenido()
	cuentaNotificaciones: -> $(".notifications .notification").length	
	
		
		

ready = ->
	lightBox.hayNotificaciones()
	$("#cierraNoti").click -> lightBox.ocultaContenido()
	$(".cierraAlerta").attr 'data-dismiss' : 'alert'
		
$(document).ready(ready)
$(document).on('page:load', ready)
