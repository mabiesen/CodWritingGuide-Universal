# Load the Rails application. Tutorial suggested filepath methodology
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :user_name => 'mabiesen',
    :password => 'S3ndS0mema!l',
    :domain => 'your_domain.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}
