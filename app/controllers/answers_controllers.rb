get '/questions/:question_id/answers' do
  @question = Question.find(params[:question_id])
  @answers = @question.answers
  erb :'answers/index'
end

get '/questions/:question_id/answers/new' do
  @question = Question.find(params[:question_id])
  erb :'answers/new'
end


post '/questions/:question_id/answers' do
  @question = Question.find(params[:question_id])
  answer = @question.answers.new(content: params[:content])
  #set answer user to current session user before saving
  answer.save
  redirect "/questions/#{@question.id}"
end


get '/questions/:question_id/answers/:id' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:id])
  erb :'answers/show'
end

get '/questions/:question_id/answers/:id/edit' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:id])
  erb :'answers/edit'
end

put '/questions/:question_id/answers/:id' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:id])
  if @answer.update_attributes(params[:answer])
    redirect "/questions/#{@question.id}/answers"
  else
    erb :'answers/edit' #show edit answers view again(potentially displaying errors)
  end
end

delete '/questions/:question_id/answers/:id' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:id])
  @answer.destroy
  redirect "/questions/#{@question.id}/answers"
end
