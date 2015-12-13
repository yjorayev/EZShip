module ApplicationHelper
	def gravatar_for(user, options = {size: 35})
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: user.firstname, class: "gravatar")
	end



	def current_user
		if (user_id = session[:user_id])
			@current_user ||= User.find_by(id: user_id)
	    elsif (user_id = cookies.signed[:user_id])
	    	user = User.find_by(id: user_id)
	    	if user && user.authenticated?(:remember, cookies[:remember_token])
	        	@current_user = user
	       	end
	    end
	end
end
