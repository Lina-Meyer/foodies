$('.reviews-all-user').click(function() {
    $('.user-reviews').toggle('slow');
    $('.top-5-user').hide(0);
    $('.wishlist-user').hide(0);
});

$('.top-5').click(function() {
    $('.top-5-user').toggle('slow');
    $('.user-reviews').hide(0);
    $('.wishlist-user').hide(0);
});

$('.wishlist').click(function() {
    $('.wishlist-user').toggle('slow');
    $('.user-reviews').hide(0);
    $('.top-5-user').hide(0);
});
