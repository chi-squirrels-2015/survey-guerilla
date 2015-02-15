$(document).ready(function() {
  $("#userlogin li").click(function(e) {
    e.preventDefault();
    var click = e.currentTarget.id;
    console.log(click)
    if (click === "logout"){
      $.ajax({
        url: "/userlogout"
      }).done(function(){
        location.reload();
      })

    }else {
      $(".signup-box").hide();
      $(".signin-box").hide();
      $("."+ click +"-box").toggle();
    }
  });
});

