class UserNotifierMailer < ActionMailer::Base
	default :from => 'upandcomming88@gmail.com'
	# send a signup email to the user, pass in the user object that  contains the user's email address
		def send_signup_email(user)
			@user = user
			mail(:to => @user.email,
				:subject => 'Thanks for signing up for our amazing app')
		end
end


# Note: deviated from directions at
#the site http://stackoverflow.com/questions/36414469/sendgrid-api-for-ruby-on-rails/36753270#36753270
# I believe site reflected deprecated defaults name for UserNotifierMailer
# Class setup suggested online was class UserNotifier < ActionMailer::Base
