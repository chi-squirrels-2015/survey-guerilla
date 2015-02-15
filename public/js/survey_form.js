var surveyId = null;

$(document).ready(function(){
  
  // set questionCount by counting number of question-details forms
  var questionCount = $("form.question-details").length;
  // add answer button logic
  // appends new answer div to question-details form
  $(".container").on("click",".add-answer",function (){
    $(this).before('<div class="answer"><input type="text" placeholder="Answer"   name="question' +questionCount +'[answers][]"> <button type="button" class="remove-answer"> - </button></div> ');
  });

  // remove answer button logic
  // removes answer div from question-details form
  $(".container").on("click",".remove-answer",function (){
    $(this).parent().remove();
  });

  // createOrUpdateSurvey() is in document.ready scope
  function createOrUpdateSurvey() {
    if (surveyId){
      // update Survey if it exists
      $.ajax({
        url: "/surveys/" + surveyId + "/edit",
        method: "put",
        data: $(".survey-details").serialize()
      });
    } else {
      // create Survey if it doesnt exist
      $.ajax({
        url: "/surveys",
        method: "post",
        data: $(".survey-details").serialize(),
        success: function(response){
          surveyId = response.id;
        }
      });
    }
  }
  //timer for survey
  var surveyTimer = null;
  $(".survey-details input, .survey-details textarea").focus( function(){
    if (surveyTimer) {
      clearTimeout(surveyTimer);
      surveyTimer = null;
    }
  });


  $(".survey-details input, .survey-details textarea").blur(function() {
      surveyTimer = setTimeout(function () {
      createOrUpdateSurvey();
      }, 1);
  });
  
  ///// QUESTIONS

  // timer for question
  var questionTimer = null;
  $(".container").on("focus", ".question-details input", function(){
    if (questionTimer) {
      clearTimeout(questionTimer);
      questionTimer = null;
    }
  });

  $(".container").on("blur", ".question-details input", function(){
    var formData= $(this).parents('form:first').serialize()
    questionTimer = setTimeout(function () {
      if (surveyId) {
        $.ajax({
              url: "/surveys/" + surveyId + "/questions",
              method: "post",
              data: formData
            });
      }
    }, 1);
  });



  //timer for mouse out event
  var mouseTimer = null;
  $(".container").on("mouseover", ".question-details input", function(){
    if (mouseTimer) {
      console.log("over")
      clearTimeout(mouseTimer);
      mouseTimer = null;
    }
  });

  $(".container").on("mouseout", ".question-details input", function(){
    var formData= $(this).parents('form:first').serialize()
    mouseTimer = setTimeout(function () {
      console.log("out")
      if (surveyId) {
        $.ajax({
              url: "/surveys/" + surveyId + "/questions",
              method: "post",
              data: formData
            });
      }
    }, 1000);
  });
  
  // add question button logic
  // adds new question-details form to container
  $("#add-question").click(function (){

    if (questionCount > 1) {
      
    }

    // increment questionCount
    questionCount += 1;

    // really long variable, because.  Maybe we will AJAX it later.
    var questionForm = '<form class="question-details" id="question'+ questionCount +'"><input type="text" placeholder="Question" name="question[content]"> <div class="answer"> <input type="text" placeholder="Answer"   name="question[answers][]"> <button type="button" class="remove-answer"> - </button> </div> <div class="answer"> <input type="text" placeholder="Answer"   name="question[answers][]"> <input type="hidden" name="question_id" value="'+ questionCount +'"> <button type="button" class="remove-answer"> - </button> </div> <button type="button" class="add-answer"> + </button></form>';

    $(this).before(questionForm);

  });

  // $("#save-survey").click(function(){
  //   $.ajax({
  //     url: "/surveys",
  //     method: "post",
  //     data: $("form").serialize()
  //   });
  // });

});
