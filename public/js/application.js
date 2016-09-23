$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  questionUpvoteListener();
  questionDownvoteListener();
});

var questionUpvoteListener = function(){
  $("#question-upvote").submit(function(e){
   e.preventDefault();

   var upvoteBtn = $(this);
   var formURL = upvoteBtn.attr('action');

   var request = $.ajax({
    url: formURL,
    method: 'post'
  });


   request.done(function(responseData){
    upvoteBtn.siblings("#question_votes_count").text(responseData);
  })
 });
};

var questionDownvoteListener = function(){
  $("#question-downvote").submit(function(e){
   e.preventDefault();

   var downvoteBtn = $(this);
   var formURL = downvoteBtn.attr('action');

   var request = $.ajax({
    url: formURL,
    method: 'post'
  });

   request.done(function(responseData){
    downvoteBtn.siblings("#question_votes_count").text(responseData);
  })
 });
};

