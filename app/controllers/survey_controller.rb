class SurveyController < ApplicationController
  def home
  end

  def submit

  	results = []

  	3.times do |j|

  		results[j] = []

			10.times do |i|

				ind = j * 10 + i + 1
				puts("#{ind}")
				key = "response#{ind}"
				results[j][i] = params[key]

	  	end
	  end

	  @res = Result.new

	  econ_res = results[0]
	  soc_res = results[1]
	  forp_res = results[2]

	  econ_score = calculate_score(econ_res)
	  soc_score = calculate_score(soc_res)
	  forp_score = calculate_score(forp_res)

	  @res.economic_score = econ_score
	  @res.social_score = soc_score
	  @res.foreign_p_score = forp_score

	  if @res.save
	  	#redirect to the results/survey page
	  else
	  	#redirect to previous page with error
	  end

  end

  def calculate_score(result_array)
  	sum = 0
		result_array.each do |r|
	  	sum += r.to_i*25
	  end

	  score = sum/result_array.size
  end

end
