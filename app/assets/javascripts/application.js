// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require jssocials.min
//= require owl-carousel/owl.carousel.js
//= require owl-carousel/owl.navigation.js
//= require owl-carousel/owl.autoplay.js

document.addEventListener('turbolinks:load', function(){
  $('.owl-carousel').owlCarousel({
    loop:true,
    nav: true,
    navText: [],
    autoplay: true,
    margin:10,
    responsiveClass:true,
    responsive:{
        0:{
          items:1
        },
        400: {
          items: 2
        },
        600:{
          items:3
        },
        1000:{
          items:2,
        }
    }
  })
})