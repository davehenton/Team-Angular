get '/' do
  redirect '/questions'
end



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

  #below works with properly formatted params in HTML form
  @question = Question.new(params[:question]) #create new question

  if @question.save #saves new question or returns false if unsuccessful
    redirect '/questions' #redirect back to questions index page
  else
    erb :'questions/new' # show new questions view again(potentially displaying errors)
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

