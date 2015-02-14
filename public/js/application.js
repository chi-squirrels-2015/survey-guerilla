$(document).ready(function() {
  $("#userlogin li").click(function(e) {
    e.preventDefault();
    var click = e.currentTarget.id;

    if (click === "logout"){
      var logout = $.ajax({
        url: "/userlogout",
      }).done(function(){
        location.reload();
      });
    } else {
      var request = $.ajax({
        url: "/userlogin",
        method: "post",
        data: {click: click}
      });
    }

    request.done(function(response){
      $(".login-popup").empty();
      $(".login-popup").append(response);
      $(".login-popup").toggle();
    });
  });
});
