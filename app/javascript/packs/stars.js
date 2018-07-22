import "jquery-bar-rating";


$(function() {
  $('#review_stars').barrating({theme: 'fontawesome-stars'});
  console.log('#review_stars')
  $('.review-stars-select').each(function() {
    $(this).barrating({theme: 'fontawesome-stars', readonly: true, emptyValue: 0});
  })
});
