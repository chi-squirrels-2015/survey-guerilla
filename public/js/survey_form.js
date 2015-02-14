

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

  // add question button logic
  // adds new question-details form to container
  $("#add-question").click(function (){

    // increment questionCount
    questionCount += 1;

    // really long variable, because.  Maybe we will AJAX it later.
    var questionForm = '<form class="question-details" id="question'+ questionCount +'"><input type="text" placeholder="Question" name="question'+ questionCount +'[content]"> <div class="answer"> <input type="text" placeholder="Answer"   name="question'+ questionCount +'[answers][]"> <button type="button" class="remove-answer"> - </button> </div> <div class="answer"> <input type="text" placeholder="Answer"   name="question'+ questionCount +'[answers][]"> <button type="button" class="remove-answer"> - </button> </div> <button type="button" class="add-answer"> + </button></form>'

    $(this).before(questionForm);

  });




});
