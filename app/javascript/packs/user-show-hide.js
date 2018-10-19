$('.reviews-all-user').click(function() {
    $('.user-reviews').show();
    $('.top-5-user').hide(0);
    $('.wishlist-user').hide(0);
    $('.freundschaftsanfragen-list').hide(0);
});


$('.wishlist').click(function() {
    $('.wishlist-user').show();
    $('.user-reviews').hide(0);
    $('.top-5-user').hide(0);
    $('.freundschaftsanfragen-list').hide(0);
});

$('.Freundschaftsanfragen').click(function(){
    $('.freundschaftsanfragen-list').show();
    $('.top-5-user').hide(0);
    $('.wishlist-user').hide(0);
    $('.user-reviews').hide(0);
})
