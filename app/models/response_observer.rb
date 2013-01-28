class ResponseObserver < ActiveRecord::Observer

	def before_save(response)
		binding.pry
		User.find(response.user_id).result.calculate_score(response)
	end

end