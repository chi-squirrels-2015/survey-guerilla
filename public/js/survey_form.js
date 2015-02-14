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
        url: "/surveys/"+surveyId+"/edit",
        method: "put",
        data: $(".survey-details").serialize(),
        success: function(response){
          surveyId = response.id;
        }
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

  var timer = null;

  $("input.survey-details, textarea").focus( function(){
    if (timer) {
      clearTimeout(timer);
      timer = null;
    }
  });


  $("input.survey-details, textarea").blur(function() {
      releaseTheHounds();
  });

  function releaseTheHounds() {
    timer = setTimeout(function () {
      createOrUpdateSurvey(); 
    }, 1);
  }


  // add question button logic
  // adds new question-details form to container
  $("#add-question").click(function (){

    // !!!temporary location, proof of concept!!!!
    // $.ajax({
    //   url: "/surveys",
    //   method: "post",
    //   data: $(".survey-details").serialize(),
    //   success: function(response){
    //     surveyId = response.id;
    //   });
    // }

    if (questionCount > 1) {
      $.ajax({
        url: "/surveys/" + surveyId + "/questions",
        method: "post",
        data: $("#question" + questionCount ).serialize()
      });      
    }

    // increment questionCount
    questionCount += 1;

    // really long variable, because.  Maybe we will AJAX it later.
    var questionForm = '<form class="question-details" id="question'+ questionCount +'"><input type="text" placeholder="Question" name="question[content]"> <div class="answer"> <input type="text" placeholder="Answer"   name="question[answers][]"> <button type="button" class="remove-answer"> - </button> </div> <div class="answer"> <input type="text" placeholder="Answer"   name="question[answers][]"> <input type="hidden" name="question_id" value="'+ questionCount +'"> <button type="button" class="remove-answer"> - </button> </div> <button type="button" class="add-answer"> + </button></form>'

    $(this).before(questionForm);

  });

  $("#save-survey").click(function(){
    $.ajax({
      url: "/surveys",
      method: "post",
      data: $("form").serialize()
    });
  });

});
