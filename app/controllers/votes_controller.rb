get '/responses/:response_id/votes' do 
  @response = Response.find(params[:response_id])
  @votes = @response.votes
  erb :'votes/index'
end

post '/responses/:response_id/votes' do
  @response = Response.find(params[:response_id])
  @vote = @response.votes.new(params[:vote])
  if @vote.save
    redirect "/responses/#{@response.id}/votes"
  else
    erb :'votes/new' #show new votes view again(potentially displaying errors)
  end
end