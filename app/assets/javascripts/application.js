// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .
$('div').on('click', function(){
$(this).toggleClass('show-description');
});
function mainmenu(){
$(' #topright_nav ul ').css({display: 'none'});
$(' #topright_nav li').hover(function(){
$(this).find('ul:first').css({visibility: 'visible',display: 'none'}).show(400);
},function(){
$(this).find('ul:first').css({visibility: 'hidden'});
});
}
$(document).ready(function(){
mainmenu();
});



$(function () {
    $("nav ul li").hover(
    function () {
        $(this).find('#my_new_nav li').stop().animate({
            height: '100%'
        }, {
            duration: 700,
            specialEasing: {
                height: 'easeOutQuint'
            }
        });
        $(this).find('div.dropdown_nav').slideDown();
    },

    function () {
        $(this).find('#my_new_nav li').stop().animate({
            height: '10px'
        }, 700);
        $(this).find('div.dropdown_nav').stop().slideUp();
    });
});

// this is for the parallax
 $(document).ready(function(){
      $('.parallax').parallax();
    });
        