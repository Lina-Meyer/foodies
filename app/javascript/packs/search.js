$('.ask-me').click(function() {
    $('.restaurant').hide();
    $('.search-home').toggle();
    $('.restaurant').hide();
});

$('.add-restaurant').click(function() {
    $('.restaurant').toggle();
    $('.search-home').hide();
});
