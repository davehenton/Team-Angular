get '/questions' do
  @questions = Question.all 
  erb :'questions/index' 
end

get '/questions/new' do
  erb :'questions/new' 
end

get '/questions/:id' do
  @question = Question.find(params[:id]) 
  erb :'questions/show' 

end


get '/questions/:id/edit' do
  @question = Question.find(params[:id]) 
  erb :'questions/edit' 
end


post '/questions' do
  @question = Question.new(params[:question])
    redirect '/questions' 
  else
    erb :'questions/new' 
  end
end

put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.assign_attributes(params[:question]) 
  if @question.save 
    redirect '/questions' 
  else
    erb :'questions/edit' 
  end

end



delete '/questions/:id' do
  @question = Question.find(params[:id])
  @question.destroy 
  redirect '/questions' 
end

