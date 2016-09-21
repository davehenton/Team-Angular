get '/answers/:answer_id/responses' do 
  @answer = Answer.find(params[:answer_id])
  @responses = @answer.responses
  erb :'responses/index'
end


get '/answers/:answer_id/responses/new' do 
  @answer = Answer.find(params[:answer_id])
  erb :'responses/new'
end

post '/answers/:answer_id/responses' do 
  @answer = Answer.find(params[:answer_id])
  @response = @answer.responses.new(params[:response])
  if @response.save
    redirect "/answers/#{@answer.id}/responses"
  else
    erb :'responses/new' 
  end
end


get '/answers/:answer_id/responses/:id' do 
  @answer = Answer.find(params[:answer_id])
  @response = @answer.responses.find(params[:id])
  erb :'responses/show'
end


get '/answers/:answer_id/responses/:id/edit' do
  @answer = Answer.find(params[:answer_id])
  @response = @answer.responses.find(params[:id])
  erb :'responses/edit'
end

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