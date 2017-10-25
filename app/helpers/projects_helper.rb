module ProjectsHelper
	def format_pledging_time(project)
		if project.pledging_expired?
			content_tag(:bold, "All Done!")
		else
			"#{distance_of_time_in_words(Time.now, project.pledging_ends_on)} from now"
		end
	end

	def image_for(project)
		if project.image_file_name.blank?
			image_tag('cat.jpg')
		else
			image_tag(project.image_file_name)
		end
	end
end
