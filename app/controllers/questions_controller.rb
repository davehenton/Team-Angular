get '/' do
  redirect '/questions'
end



get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end


# get '/questions/:id/edit' do
#   @question = Question.find(params[:id])
#   erb :'questions/edit'
# end

post '/questions' do
  if current_user
    question = Question.create(title: params[:title], content: params[:content]) #create new question
    current_user.questions << question
    current_user.save
  end
 redirect "/questions/#{question.id}"
end


# put '/questions/:id' do
#   @question = Question.find(params[:id])
#   @question.assign_attributes(params[:question])
#   if @question.save
#     redirect '/questions'
#   else
#     erb :'questions/edit'
#   end
# end



delete '/questions/:id' do
  @question = Question.find(params[:id])
  @question.destroy
  redirect '/questions'
end

