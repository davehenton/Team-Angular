get '/answers/:answer_id/responses' do
  @answer = Answer.find(params[:answer_id])
  @responses = @answer.responses
  erb :'responses/index'
end


get '/answers/:answer_id/responses/new' do
  @answer = Answer.find(params[:answer_id])
  erb :'responses/new'
end

post '/questions/:question_id/responses' do
  @question = Question.find(params[:question_id])
  response = @question.responses.new(content: params[:content], responder_id: current_user.id )
  if current_user
    response.save
  end
    redirect "/questions/#{params[:question_id]}"
end

post '/questions/:question_id/answers/:answer_id/responses' do
  @answer = Answer.find(params[:answer_id])
  response = @answer.responses.new(content: params[:content], responder_id: current_user.id )
  if current_user
    response.save
  end
    redirect "/questions/#{params[:question_id]}"
end



# get '/answers/:answer_id/responses/:id' do
#   @answer = Answer.find(params[:answer_id])
#   @response = @answer.responses.find(params[:id])
#   erb :'responses/show'
# end


# get '/answers/:answer_id/responses/:id/edit' do
#   @answer = Answer.find(params[:answer_id])
#   @response = @answer.responses.find(params[:id])
#   erb :'responses/edit'
# end

put '/answers/:answer_id/responses/:id' do
  @answer = Answer.find(params[:answer_id])
  @response = @answer.responses.find(params[:id])
  if @response.update_attributes(params[:response])
    redirect "/answers/#{@answer.id}/responses"
  else
    erb :'responses/edit'
  end
end

delete '/answers/:answer_id/responses/:id' do
  @answer = Answer.find(params[:answer_id])
  @response = @answer.responses.find(params[:id])
  @response.destroy
  redirect "/answers/#{@answer.id}/responses"
end
