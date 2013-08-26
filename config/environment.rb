# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
NewProject::Application.initialize!
heroku config:add FOG_PROVIDER=AWS AWS_ACCESS_KEY_ID=1D8S6N5SRNV1J2S0M3R2 AWS_SECRET_ACCESS_KEY=VnEiLgWaeWdaq/2gkOwUScHMriBRR0DUYmg9ZPQa
heroku config:add FOG_DIRECTORY=static_images