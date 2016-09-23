post '/questions/:question_id/answers/:answer_id/best_answer' do
  answer = Answer.find(params[:answer_id])
  question = Question.find(params[:question_id])
  question.best_answer = answer
  redirect "/questions/#{params[:question_id]}"
end

post '/questions/:question_id/answers' do
  @question = Question.find(params[:question_id])
  answer = @question.answers.new(content: params[:content])
  if current_user
    answer.answerer = current_user
    answer.save
  end
  redirect "/questions/#{@question.id}"
end

# Question Responses


# Answer

# put '/questions/:question_id/answers/:id' do
#   @question = Question.find(params[:question_id])
#   @answer = @question.answers.find(params[:id])
#   if @answer.update_attributes(params[:answer])
#     redirect "/questions/#{@question.id}/answers"
#   else
#     erb :'answers/edit' #show edit answers view again(potentially displaying errors)
#   end
# end

# delete '/questions/:question_id/answers/:id' do
#   @question = Question.find(params[:question_id])
#   @answer = @question.answers.find(params[:id])
#   @answer.destroy
#   redirect "/questions/#{@question.id}/answers"
# end
