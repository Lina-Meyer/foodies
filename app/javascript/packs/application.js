import "bootstrap";

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

    // $(".form-wrapper").submit(function(e) {
    //   e.preventDefault();
    // });

    // if(currentSectionIndex === 3){
    //   $(document).find(".form-wrapper .section").first().addClass("is-active");
    //   $(document).find(".steps li").first().addClass("is-active");
    // }
  });
});

