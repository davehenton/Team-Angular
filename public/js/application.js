$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  questionUpvoteListener();
  questionDownvoteListener();
  responseUpvoteListener();
  responseDownvoteListener();
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

var responseUpvoteListener = function(){
  $("#response-upvote").submit(function(e){
    e.preventDefault();
    var rUpvoteBtn = $(this);
    var rFormURL = rUpvoteBtn.attr('action');
    var request = $.ajax({
    url: rFormURL,
    method: 'post'
  });
    request.done(function(data){
    rUpvoteBtn.siblings().children("#response_votes_count").text(data);
   })
  });
};

var responseDownvoteListener = function(){
  $("#response-downvote").submit(function(e){
    e.preventDefault();
    var rDownvoteBtn = $(this);
    var rFormURL = rDownvoteBtn.attr('action');
    console.log(rFormURL);

    var request = $.ajax({
    url: rFormURL,
    method: 'post'
  });
    request.done(function(data){
    rDownvoteBtn.siblings("p").children("#response_votes_count").text(data);
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

