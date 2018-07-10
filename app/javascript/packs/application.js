import "bootstrap";
import "jquery-bar-rating";

// toggle button
$("document").ready(function(){
  $(".tab-slider--body").hide();
  $(".tab-slider--body:first").show();
});

$(".tab-slider--nav li").click(function() {
  $(".tab-slider--body").hide();
  var activeTab = $(this).attr("rel");
  $("#"+activeTab).fadeIn();
  if($(this).attr("rel") == "tab2"){
    $('.tab-slider--tabs').addClass('slide');
  }else{
    $('.tab-slider--tabs').removeClass('slide');
  }
  $(".tab-slider--nav li").removeClass("active");
  $(this).addClass("active");
});


$(document).ready(function(){
  $(".submit-button").click(function(){
    var button = $(this);
    var currentSection = button.parents(".section");
    var currentSectionIndex = currentSection.index();
    var headerSection = $('.steps li').eq(currentSectionIndex);
    currentSection.removeClass("is-active").next().addClass("is-active");
    headerSection.removeClass("is-active").next().addClass("is-active");
  });
});


$(function() {
  $('#rating_stars').barrating({theme: 'fontawesome-stars'});
  // $('.review-stars-select').each(function() {
  //   $(this).barrating({theme: 'fontawesome-stars', readonly: true, emptyValue: 0});
  // })
});





