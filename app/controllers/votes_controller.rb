post '/questions/:question_id/upvotes' do
  question = Question.find(params[:question_id])

  if current_user && !current_user.votes.include?(Vote.find_by(voter_id: current_user.id, votable_type: "Question", votable_id: params[:question_id]))
    current_user.votes << Vote.create(upvote?: true, votable_type: "Question", votable_id: params[:question_id])
  end
  if request.xhr?
    count = question.votes.where(upvote?: true).count - question.votes.where(upvote?: false).count
    count.to_s
  else
    redirect "/questions/#{params[:question_id]}"
  end
end

post '/questions/:question_id/downvotes' do
  if current_user && !current_user.votes.include?(Vote.find_by(voter_id: current_user.id, votable_type: "Question", votable_id: params[:question_id]))
    current_user.votes << Vote.create(upvote?: false, votable_type: "Question", votable_id: params[:question_id])
  end
  redirect "/questions/#{params[:question_id]}"
end

post '/questions/:question_id/responses/:response_id/upvotes' do
  if current_user && !current_user.votes.include?(Vote.find_by(voter_id: current_user.id, votable_type: "Response", votable_id: params[:response_id]))
    current_user.votes << Vote.create(upvote?: true, votable_type: "Response", votable_id: params[:response_id])
  end


  if request.xhr?
    response = Response.find(params[:response_id])
    count = response.votes.where(upvote?: true).count - response.votes.where(upvote?: false).count
    count.to_s
    p "*"*100
    p response
    p "*"*100
    p count.to_s

  else
    redirect "/questions/#{params[:question_id]}"
  end

end

post '/questions/:question_id/responses/:response_id/downvotes' do
  if current_user && !current_user.votes.include?(Vote.find_by(voter_id: current_user.id, votable_type: "Response", votable_id: params[:response_id]))
    current_user.votes << Vote.create(upvote?: false, votable_type: "Response", votable_id: params[:response_id])
  end
  redirect "/questions/#{params[:question_id]}"
end

post '/questions/:question_id/answers/:answer_id/upvotes' do
  if current_user && !current_user.votes.include?(Vote.find_by(voter_id: current_user.id, votable_type: "Answer", votable_id: params[:answer_id]))
    current_user.votes << Vote.create(upvote?: true, votable_type: "Answer", votable_id: params[:answer_id])
  end
  redirect "/questions/#{params[:question_id]}"
end

post '/questions/:question_id/answers/:answer_id/downvotes' do
  if current_user && !current_user.votes.include?(Vote.find_by(voter_id: current_user.id, votable_type: "Answer", votable_id: params[:answer_id]))
    current_user.votes << Vote.create(upvote?: false, votable_type: "Answer", votable_id: params[:answer_id])
  end
  redirect "/questions/#{params[:question_id]}"
end
