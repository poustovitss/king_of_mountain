//= require rails-ujs
//= require turbolinks
//= require_tree .

$('document').ready(function() {
  setTimeout(function() {
    $('.alert, .notice').animate({opacity: '0'}, 1500).fadeOut('fast');
  }, 5000);
});
