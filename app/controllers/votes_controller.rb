post '/questions/:question_id/upvotes' do
  if current_user
    current_user.votes << Vote.create(upvote?: true, votable_type: "Question", votable_id: params[:question_id])
  end
  redirect "/questions/#{params[:question_id]}"
end

post '/questions/:question_id/downvotes' do
  if current_user
    current_user.votes << Vote.create(upvote?: false, votable_type: "Question", votable_id: params[:question_id])
  end
  redirect "/questions/#{params[:question_id]}"
end

post '/questions/:question_id/responses/:response_id/upvotes' do
  if current_user
    current_user.votes << Vote.create(upvote?: true, votable_type: "Response", votable_id: params[:response_id])
  end
  redirect "/questions/#{params[:question_id]}"
end

post '/questions/:question_id/responses/:response_id/downvotes' do
  if current_user
    current_user.votes << Vote.create(upvote?: false, votable_type: "Response", votable_id: params[:response_id])
  end
  redirect "/questions/#{params[:question_id]}"
end

post '/questions/:question_id/answers/:answer_id/upvotes' do
  if current_user
    current_user.votes << Vote.create(upvote?: true, votable_type: "Answer", votable_id: params[:answer_id])
  end
  redirect "/questions/#{params[:question_id]}"
end

post '/questions/:question_id/answers/:answer_id/downvotes' do
  if current_user
    current_user.votes << Vote.create(upvote?: false, votable_type: "Answer", votable_id: params[:answer_id])
  end
  redirect "/questions/#{params[:question_id]}"
end
